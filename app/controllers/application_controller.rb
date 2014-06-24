class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protect_from_forgery
  
  layout :layout
  
protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :first_name, :last_name, :about, :location_attributes => [:zipcode])}
  end

private
  
  def layout
    if (is_a?(Devise::SessionsController) || is_a?(Devise::RegistrationsController))
      "login"
    else
      "application"
    end
  end
 
end
