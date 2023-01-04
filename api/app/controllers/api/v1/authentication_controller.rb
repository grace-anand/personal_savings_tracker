class Api::V1::AuthenticationController < ApplicationController
  before_action :authenticate_request, except: :login

  def login
      @user = User.find_by_email(params[:email])
      if @user&.authenticate(params[:password])
          expiration_time = 14.days.from_now
          token = jwt_encode(user_id: @user.id,exp: expiration_time)
          render json: { token: token, exp: expiration_time.strftime("%m-%d-%Y %H:%M"),
            email: @user.email }, status: :ok
      else
          render json: {error: 'unauthorized'}, status: :unauthorized
      end
  end
end

