class UsersController < ApplicationController
  def index
    users = User.all
    render json: { users: users }
  end

  def show
    user = User.find(params[:id])
    render json: { user: user }
  end

  def create
    user = User.new(user_params)
    if user.save
      login!
      render json: {
        status: :created,
        user: @user
      }
    else
      render json: {
        status: 500,
        errors: user.errors.full_messages
      }
    end
  end

  private

  def user_params
    params
      .require(:user)
      .permit(
        :first_name, 
        :last_name, 
        :password_confirmation
      )
  end
end
