class ApplicationController < ActionController::API
  abstract!
  include DeviseTokenAuth::Concerns::SetUserByToken

end
