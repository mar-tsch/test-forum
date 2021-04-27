class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = User.find(params[:id])
    if @post.save
      flash[:success] = "Your post is online!"
      redirect_to @post
    else
      flash.now[:error] = "Oops, something went wrong"
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.user = User.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:success] = "Your post is updated"
      redirect_to @post
    else
      flash[:error] = "Oops, something went wrong"
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = 'Your post is deleted.'
    else
      flash[:error] = 'Oops, something went wrong'
    end
    redirect_to posts_url
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comments = @post.comments
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
