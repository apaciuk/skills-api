require 'active_support/all'
class ApplicationController < ActionController::API
    include ActionController::Cookies
    include ActionController::RequestForgeryProtection
    rescue_from DocumentException, :with => :handle_document_exception
    
    def handle_document_exception(exception)
        @document = exception.document
        render :action => 'new'
    end

    private 

    def current_user
        User.find_by(id: session[:user_id])
    end
end
