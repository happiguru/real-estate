class Api::V1::LoginController < ActionController::API
  def create
    @user = User.find_by("lower(username) = ?", user_params[:username].downcase)
    if @user && @user.authenticate(user_params[:password])
      token = encode_token({ user_id: @user_id })
      render json: { logged_in: true, user: user_data(@user), token: token }
      # render json: { token: token(user.id), user_id: user.id }, status: :created
    else
      render json: { errors: ["Sorry, incorrect username or password"] }, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
  def user_data(user)
  
      id: user_id,
      username: user.username
      # admin: user.admin
    }
  end
end
