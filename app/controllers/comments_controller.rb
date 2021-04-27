class CommentsController < ApplicationController
  before_action :find_post
  before_action :find_user

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params_comment)
    @comment.user = User.find(params[:id])
    @comment.post = Post.find(params[:id])
    if @comment.save
      flash[:success] = "Comment successfully added"
      redirect_to @comment
    else
      flash[:error] = "Oops, something went wrong"
      render 'new'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:success] = "Your comment was deleted."
    else
      flash[:error] = "Oops, something went wrong"
    end
    redirect_to comments_url
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
