class UsersController < ApplicationController
  
  def index
    @users = User.except_me(current_user).all
  end
  
  def me
    @user = current_user
    @user.location = @user.location || @user.build_location
    @jobs = @user.jobs
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
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
  
  private
  
  def user_params
    params.required(:user).permit(:first_name, :last_name, :about, :location_attributes => [:city, :state])
  end
end