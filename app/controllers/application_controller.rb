class ApplicationController < ActionController::API
    # private
    # def token(user_id)
    #     payload = { user_id: user_id }
    #     JWT.encode(payload, hmac_secret, 'HS256')
    # end

    # def hmac_secret
    #     ENV["API_SECRET_KEY"]
    # end

    # def client_has_valid_token?
    #     !!current_user_id
    # end

    # def current_user_id
    #     begin
    #         token = request.headers["Authorization"]
    #         decoded_array = JWT.decode(token, hmac_secret, true, { algorithm: 'HS256'})
    #         payload = decoded_array.first
    #     rescue #JWT:: VerificationError
    #         return nil
    #     end
    #     payload["user_id"]
    # end

    # def require_login
    #     render json: {error: 'Unauthorized'}, status: :unauthorized if !client_has_valid_token?
    # end
    # SECRET_KEY = Rails.application.credentials.jwt[:secret].to_s
  SECRET_KEY = ENV.fetch('SECRET_KEY')
  # EXPIRES_IN = Rails.application.credentials.jwt[:expires_in]
  EXPIRES_IN = 2

  def authorized
    render json: { message: 'Please log in' }, status: 401 unless logged_in?
  end

  def encode_token(payload)
    payload[:exp] = EXPIRES_IN.days.from_now.to_i
    JWT.encode(payload, SECRET_KEY, 'HS256')
  end

  def auth_header
    return unless request.headers['Authorization']

    request.headers['Authorization'].split[1]
  end

  def decoded_token
    return unless auth_header

    token = auth_header
    begin
      JWT.decode(token, SECRET_KEY, true, algorithm: 'HS256')
    rescue JWT::DecodeError
      nil
    end
  end

  def logged_in_user
    return unless decoded_token

    user_id = decoded_token[0]['user_id']
    @current_user = User.find_by(id: user_id)
  end

  def logged_in?
    logged_in_user ? true : false
  end
end
