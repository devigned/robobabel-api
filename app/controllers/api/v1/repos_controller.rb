require 'gh'

class Api::V1::ReposController < AuthenticatedController
  def index
    render json: current_user.repos
  end
end
