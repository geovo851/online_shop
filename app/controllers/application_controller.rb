class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter { |c| Authorization.current_user = c.current_user }

  protect_from_forgery with: :exception
  
  protected
    def permission_denied
      flash[:error] = "Sorry, you are not allowed to access that page."
      redirect_to root_url
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :role_id
      devise_parameter_sanitizer.for(:account_update) << :role_id
    end
end
