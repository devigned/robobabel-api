class User < ApplicationRecord
  has_many :repos

  scope :by_provider_and_uid, -> (provider, uid) { where(provider: provider, uid: uid) }

  def self.find_or_create_user_from_auth_hash(auth_hash)
    user = User.by_provider_and_uid(auth_hash[:provider], auth_hash[:uid]).first
    unless user
      params = {
          provider: auth_hash[:provider],
          uid: auth_hash[:uid],
          name: auth_hash[:info][:name],
          nickname: auth_hash[:info][:nickname],
          email: auth_hash[:info][:email],
          provider_token: auth_hash[:credentials][:token],
          provider_info: auth_hash[:info].merge(auth_hash[:extra][:raw_info])
      }
      user = User.create(params)
    end
    user
  end

  def github_repos
    raise ArgumentError.new('provider token is empty') if self.provider_token.blank?
    raise ArgumentError.new('nickname is empty') if self.nickname.blank?

    authenticated = GH::DefaultStack.build(token: self.provider_token)
    repos = []
    GH.with(authenticated) do
      repos = GH["users/#{self.nickname}/repos"]
    end
    repos
  end

  def sync_github_repos!
    gh_repos = self.github_repos
    ids = Set.new(self.repos.pluck(:github_id))

    repos = gh_repos.map do |gh_repo|
      unless ids.include?(gh_repo['id'])
        attrs = {github_id: gh_repo['id']}.merge(gh_repo.slice('name', 'description', 'full_name', 'private',
                                                               'language', 'homepage', 'created_at', 'updated_at'))
        Repo.new(attrs)
      end
    end.select(&:present?)

    self.repos << repos
    self.save!
  end
end
