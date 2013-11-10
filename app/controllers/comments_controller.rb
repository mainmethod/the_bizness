class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(params[:comment])
    @comment.parent_id = params[:post_id]
    @comment.user = current_user
    @comment.save
    respond_to do |format|
      format.js
    end
  end
  
end