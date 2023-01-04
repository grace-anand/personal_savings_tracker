class Api::V1::UserController < ApplicationController
#   skip_before_action :authenticate_request, only: [:create]
    before_action :set_user, only: [:show, :destroy, :update]


  
    def index
        @users = User.all
        render json: @users, each_serializer: UserSerializer , status: :ok
    end

    def show
        render json: @user, status: :ok
    end

    def create 
        @user = User.new(user_params)
      
        if @user.save
            render json: @user, serializer: UserSerializer, status: :created
        else
            render json: { errors: @user.errors.full_messages},
                status: :unprocessable_entity
        end
    end

    def update
        unless @user.update(user_params)
            render json: { errors: @user.errors.full_messages},
                status: :unprocessable_entity
        else
            render json: @user, serializer: UserSerializer, status: :ok
        end
    end

  def destroy
      @user.destroy
      render_ok
  end

  private
      def user_params
          
          params.permit(:first_name, :last_name, :email, :password, :avatar)
      end

      def set_user
          @user = User.find(params[:id])
      end
end