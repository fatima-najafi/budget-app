class ApplicationController < ActionController::Base
    #  helper_method :current_user
  protect_from_forgery with: :exception
  before_action :update_allowed_parameters, if: :devise_controller?

def update_allowed_parameters
  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
end
 

#   def current_user
#     @current_user ||= User.find_by(id: session[:user_id])
#   end
end