require 'netaddr'

GITHUB_CIDR = NetAddr::CIDR.create('192.30.252.0/22')

class SessionsController < ApplicationController
  include Tokens
  include GithubWhitelist

  def create
    @user = User.find_or_create_user_from_auth_hash(auth_hash)
    auth_origin = "http://localhost:8081/oauth2callback?access_token=#{token_from_user(@user)}"
    redirect_to auth_origin
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end