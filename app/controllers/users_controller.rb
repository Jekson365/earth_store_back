class UsersController < ApplicationController
  def new
    user = User.new(user_params)
    user.role_id = 1
    if is_valid?
      if user.save
        UserMailer.confirmation_email(user).deliver_now
      else

        render json: user.errors.full_messages, status: :conflict
      end
    else
      render json: 'password does not match'
    end
  end

  def confirm_email
    user = User.find_by(confirmation_token: params[:token])

    if user && user.confirmation_sent_at >= 2.days.ago
      user.update(confirmed_at: Time.now.utc, confirmation_token: nil)
      render json: { message: "Email confirmed successfully!" }, status: :ok
    else
      render json: { error: "Invalid or expired token" }, status: :unprocessable_entity
    end
  end

  def get_current_user
    token = decode_token(params[:token])
    render json: User.find(token[:user_id])
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