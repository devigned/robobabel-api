require 'jwt'

module Authentication
  extend ActiveSupport::Concern
  include Tokens

  included do
    before_action :authenticate_user!
  end

  def authenticate_user!
    begin
      bearer = request.headers['Authorization']
      token = bearer.gsub('Bearer ', '')
      decoded = decode_token(token)[0]
      @current_user = User.by_provider_and_uid(decoded['provider'], decoded['uid']).first
      unless !!@current_user
        head :unauthorized
      end
    rescue Exception => ex
      Rails.logger.error(ex)
      head :unauthorized
    end
  end

  def current_user
    unless !!@current_user
      authenticate_user!
    end
    @current_user
  end
end