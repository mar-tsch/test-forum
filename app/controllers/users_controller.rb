class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account created, welcome"
      redirect_to @user
    else
      flash.now[:error] = "Oops,something went wrong"
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Your account is up to date"
      redirect_to @user
    else
      flash.now[:error] = "Oops, something went wrong"
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:success] = "Goodbye!"
      redirect_to home
    else
      flash.now[:error] = "Oops, something went wrong"
      redirect_to @user
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :age, :mail, :password)
  end
end
