class PostsController < ApplicationController
  
  def create
    @post = Post.new(params[:post])
    @post.user = current_user
    @post.parent_id = 0
    @post.save
    respond_to do |format|
      format.js
    end
  end
  
  def index
    @posts = Post.recent().all
  end
  
end