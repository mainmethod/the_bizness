class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    @comment.parent_id = params[:post_id]
    @comment.save
    redirect_to profile_path
  end
  
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    respond_to do |f|
      f.js
    end
  end
  
end