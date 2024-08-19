class ApplicationController < ActionController::API
  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    decoded = decode_token(header)
    if decoded
      @current_user = User.find(decoded[:user_id])
    else
      render json: 'you are not authorized'
    end
  rescue ActiveRecord::RecordNotFound, JWT::DecodeError
    render json: { errors: 'Unauthorized' }, status: :unauthorized
  end

  def authorize_if_admin
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    decoded = decode_token(header)
    @current_user = User.find(decoded[:user_id]) if decoded
    unless @current_user&.role_id == 2
      render json: { errors: 'you need admin user!' }, status: :unauthorized
    end
  rescue ActiveRecord::RecordNotFound, JWT::DecodeError
    render json: { errors: 'Unauthorized' }, status: :unauthorized
  end
  def authorize_api_key
    api_key = request.headers['API_KEY']

  end
  def decode_token(token)
    JWT.decode(token, Rails.application.secrets.secret_key_base)[0].with_indifferent_access
  rescue JWT::DecodeError
    nil
  end
end
