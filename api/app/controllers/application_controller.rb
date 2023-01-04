class ApplicationController < ActionController::API
  include JsonWebToken

  before_action :authenticate_request

  rescue_from ActiveRecord::RecordNotFound, with: :invalid_record
  rescue_from ActiveRecord::RecordNotDestroyed, with: :render_unprocessed
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
  rescue_from JWT::DecodeError, with: :unauthorised_request

  private

        def authenticate_request
            header = request.headers['Authorization']
            header = header.split(' ').last if header
            decoded = jwt_decode(header)
            @current_user = User.find(decoded[:user_id])
        end

        # Exception handlings
        def unauthorised_request(event)
            render json: {"message": "Unauthorized User"}, status: :unauthorized
        end

        def invalid_record(event)
            render json: {"message": event}, status: :not_found
        end

        # Common renderings
        def render_ok(event="Success")
            render json: {"result":event}, status: :ok
        end

    def render_unprocessed(event="Unprocessable Entity")
            render json: {"message":event}, status: :unprocessable_entity
        end

    end


    {
        "status": "200",
        "result": []
        "message": "Sample message"
    }