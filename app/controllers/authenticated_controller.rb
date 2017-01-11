class AuthenticatedController < ApplicationController
  include Authentication
  abstract!

end
