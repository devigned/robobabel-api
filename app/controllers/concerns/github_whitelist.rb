module GithubWhitelist
  extend ActiveSupport::Concern

  GITHUB_CIDR = NetAddr::CIDR.create('192.30.252.0/22')

  included do
    before_action :from_github
  end

  def from_github
    if !GITHUB_CIDR.contains?(request.ip) && Rails.env.production?
      head :unauthorized
    end
  end

end