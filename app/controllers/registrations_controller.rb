class RegistrationsController < Devise::RegistrationsController
  before_action :not_found

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end