class HomeController < ApplicationController
  
  def index
    
  end
  
  def search
    @users = User.where("first_name like ? or last_name like ?","%#{params[:term]}%","%#{params[:term]}%")
    respond_to do |format|
      format.json
    end
  end
  
end