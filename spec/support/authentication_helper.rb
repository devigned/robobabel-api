module AuthenticationHelper
  include Tokens
  def authenticate_user(user)
    @request.headers.merge!({'Authorization' => "Bearer #{token_from_user(user)}"})
  end
end