class UnlocksController < Devise::UnlocksController
  before_action :not_found

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end