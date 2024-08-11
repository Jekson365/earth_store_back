class UsersController < ApplicationController
  def new
    user = User.new(user_params)
    user.role_id = 1
    if is_valid?
      unless user.save
        render json: user.errors.full_messages
      end
    else
      render json: 'password does not match'
    end
  end
  def is_valid?
    if user_params[:password] == user_params[:password_confirmation]
      true
    else
      false
    end
  end

  private
  def user_params
    params.require(:user).permit(:username,:email,:password,:password_confirmation)
  end
  def login_params
    params.require(:user).permit(:email,:password)
  end
end