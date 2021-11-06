class Api::V1::UsersController < ActionController::API

    def show
        render json: @current_user, status: 200
    end

    def create
        @user = User.create(username: user_params[:username], password: user_params[:password])

        if @user.valid?
            token = encode_token({ user_id: @user_id })
            render json: { status: :created, user: user_data(@user), token: token }, status: 201
        else
            render json: { errorMsgs: @user.errors.full_messages }, status: 422
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :user_id)
    end

    def user_data(user)
        {
            id: user_id,
            username: user.username
            # admin: user.admin
        }
        
    end
end
