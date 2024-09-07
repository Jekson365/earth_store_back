class UsersController < ApplicationController
  def new
    user = User.new(user_params)
    user.role_id = 1
    if is_valid?
      if user.save
        render json: 'success',status: :ok
      else
        render json: user.errors.full_messages, status: :conflict
      end
    else
      render json: { error: 'password does not match' }, status: :unauthorized
    end
  end

  def confirm_email
    user = User.find_by(confirmation_token: params[:token])

    if user.present?
      user.confirm_email
      render json: 'user confirmed'
    end
  end

  def get_current_user
    token = decode_token(params[:token])
    render json: UsersBlueprint.render(User.find(token[:user_id]), view: :normal)
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
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def login_params
    params.require(:user).permit(:email, :password)
  end
end