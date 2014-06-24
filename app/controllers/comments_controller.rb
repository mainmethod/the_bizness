class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(comment_params)
    @comment.parent_id = params[:post_id]
    @comment.user = current_user
    @comment.save
  end
  
  private
  
  def comment_params
    params.required(:comment).permit(:content)
  end
  
end