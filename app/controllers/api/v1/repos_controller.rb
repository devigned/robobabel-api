require 'gh'

class Api::V1::ReposController < AuthenticatedController
  before_action :set_repo, only: [:update, :show]

  def index
    render json: current_user.repos
  end

  def update
    if @repo.update(repo_params)
      render json: @repo
    else
      render json: @repo.errors, status: :unprocessable_entity
    end
  end

  def show
    if @repo
      render json: @repo
    else
      render json: {error: 'not found'}, status: :not_found
    end
  end

  private
  def set_repo
    @repo = current_user.repos.find(params[:id])
  end

  def repo_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: [:tracked])
  end

end
