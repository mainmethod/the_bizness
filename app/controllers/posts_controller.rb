class PostsController < ApplicationController
  
  def create
    @post = Post.new(post_params)
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
  
  private
  
  def post_params
    params.required(:post).permit(:content)
  end
  
end