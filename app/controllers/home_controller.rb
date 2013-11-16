class HomeController < ApplicationController
  
  def index
    
  end
  
  def search
    @users = params[:term] ? User.except_me(current_user).where("first_name like ? or last_name like ?","%#{params[:term]}%","%#{params[:term]}%") : [];
    respond_to do |format|
      format.js
    end
  end
  
end