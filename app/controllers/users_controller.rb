class UsersController < ApplicationController
  
  def index
    @users = User.except_me(current_user).all
  end
  
  def me
    @user = current_user
    @user.location = @user.location || @user.build_location
  end
  
  def update
    @user = User.find(params[:id])
    @location = Location.find_or_create_by_city_and_state(params[:user][:location_attributes][:city],params[:user][:location_attributes][:state])
    @location.save!
    if @user.update_attributes(params[:user])
      flash[:notice] = "Your profile has been updated"
    else
      flash[:alert] = "There was a problem updating your profile"
    end
    redirect_to profile_path
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def follow
    followed_user = User.find(params[:id])
    current_user.follow!(followed_user)
    redirect_to user_url(followed_user)
  end
  
  def unfollow
    followed_user = User.find(params[:id])
    current_user.unfollow!(followed_user)
    redirect_to user_url(followed_user)
  end
end