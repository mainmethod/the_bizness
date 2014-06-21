class HomeController < ApplicationController
  
  def index
    
  end
  
  def search
    term = params[:term] ? params[:term] : ''
    @users = User.except_me(current_user).search(term).limit(7)
    @locations = Location.search(term).limit(7)
    respond_to do |format|
      format.js
    end
  end
  
end