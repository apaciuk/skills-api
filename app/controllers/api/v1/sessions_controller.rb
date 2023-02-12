module Api
    module V1
    class SessionsController < Devise::SessionsController 
        skip_before_action :verify_authenticity_token, raise: false
        before_action :authenticate_devise_api_token!, only: [:restricted]
        def create
            user = User.find_by(email: params[:email])
            if user && user.valid_password?(params[:password])
                render json: { message: "You are logged in as #{user.email}" }, status: :ok 
            else
                render json: { message: "Invalid email or password" }, status: :unauthorized
            end
        end 

        def destroy
            user = User.find_by(email: params[:email])
            if user && user.valid_password?(params[:password])
                render json: { message: "You are logged out as #{user.email}" }, status: :ok 
            else
                render json: { message: "Invalid email or password" }, status: :unauthorized
            end
        end

        def restricted
            devise_api_token = current_devise_api_token
            if devise_api_token
                render json: { message: "You are logged in as #{devise_api_token.resource_owner.email}" }, status: :ok 
            else
                render json: { message: "You are not logged in" }, status: :unauthorized
            end 
        end 

        private

        def user_params
            params.require(:user).permit(:email, :password, :password_confirmation)
        end
    end
    end
end
