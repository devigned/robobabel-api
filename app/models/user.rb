class User < ApplicationRecord

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
end
