class HomeController < ApplicationController
  
  def index
    
  end
  
  def search
    @users = User.where("first_name like ? or last_name like ?","%#{params[:term]}%","%#{params[:term]}%")
    render json: @users
  end
  
end