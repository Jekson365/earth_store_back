class AuthenticationController < ApplicationController
  def login
    @user = User.find_by(email: login_params[:email])

    if @user&.authenticate(login_params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { token: token }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def authorize_admin

  end
  private
  def login_params
    params.require(:user).permit(:email,:password)
  end
  def encode_token(payload)
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end
end