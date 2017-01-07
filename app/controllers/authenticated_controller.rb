class AuthenticatedController < ApplicationController
  abstract!
  before_action :authenticate_user!

end
