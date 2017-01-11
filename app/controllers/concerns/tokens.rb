require 'securerandom'

module Tokens
  extend ActiveSupport::Concern

  def decode_token(token)
    JWT.decode(token, Rails.application.secrets.secret_key_base, true, {:algorithm => 'HS512'})
  end

  def token_from_user(user)
    encode_token({provider: user.provider, uid: user.uid, nonce: SecureRandom.base58(20)})
  end

  def encode_token(payload)
    JWT.encode(payload, Rails.application.secrets.secret_key_base, 'HS512')
  end
end