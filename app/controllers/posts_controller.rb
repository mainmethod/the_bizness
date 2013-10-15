class PostsController < ApplicationController
  
  def create
    @post = Post.new(params[:post])
    @post.user = current_user
    @post.parent_id = 0
    @post.save
    redirect_to profile_path
  end
  
end