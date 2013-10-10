class UsersController < ApplicationController
  
  def index
    @users = User.except_me(current_user).all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def follow
    followed_user = User.find(params[:id])
    current_user.follow!(followed_user)
    redirect_to current_user
  end
  
  def unfollow
    followed_user = User.find(params[:id])
    current_user.unfollow!(followed_user)
    redirect_to current_user
  end
end