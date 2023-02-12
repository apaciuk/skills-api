module Api
    module V1
    class RegistrationsController < Devise::RegistrationsController
        skip_before_action :verify_authenticity_token, raise: false
        before_action :authenticate_devise_api_token!, only: [:restricted]
        def create
            user = User.new(user_params)
            if user.save
                render json: { message: "You are logged in as #{user.email}" }, status: :ok 
            else
                render json: { message: "Invalid email or password" }, status: :unauthorized
            end
        end 

        private

        def user_params
            params.require(:user).permit(:email, :password, :password_confirmation)
        end
    end
    end
end
