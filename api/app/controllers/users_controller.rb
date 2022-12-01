class UsersController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_user, except: %i[create index]

  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: {error: 'User not created'}, status: :unprocessable_entity
    end
  end

  def show
    render json: @user, status: :ok
  end

  def update
    if @user.update!(user_params)
      render json: @user, status: :ok
    else
      render json: {error: 'User not updated'}, status: :unprocessable_entity 
    end
  end

  def destroy
    if @user.destroy
      render json: @users status: :ok
    else
      render json: 'User not deleted', status: :unprocessable_entity
    end
  end

  private
  def find_user
    @user = User.find_by_username(params[:_username])
  rescue ActiveRecord::RecordNotFound
    render json: {error: 'User not found'}, status: :unprocessable_entity
  end

  def user_params
    params.require(:user).permit(:user_name, :email, :age, :dob, :password, :password_confiramtion)
  end
end
