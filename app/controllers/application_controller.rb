class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  
  protect_from_forgery
  
  layout :layout

private
  
  def layout
    if (is_a?(Devise::SessionsController) || is_a?(Devise::RegistrationsController))
      "login"
    else
      "application"
    end
  end
 
end
