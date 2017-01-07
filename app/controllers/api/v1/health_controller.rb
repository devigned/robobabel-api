module Api
  module V1
    class HealthController < AuthenticatedController

      def index
        render json: {status: 'healthy!'}
      end

    end
  end
end
