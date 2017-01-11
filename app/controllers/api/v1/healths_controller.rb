class Api::V1::HealthsController < AuthenticatedController
  def index
    render json: Health.all
  end
end
