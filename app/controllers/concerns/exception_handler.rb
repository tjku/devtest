module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity

    protected

    def not_found(error)
      render json: { message: error.message }, status: :not_found
    end

    def unprocessable_entity(error)
      render json: { message: error.message }, status: :unprocessable_entity
    end
  end
end
