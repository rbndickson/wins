class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You have been registered and logged in."
      session[:user_id] = @user.id
      redirect_to wins_path
    else
      flash[:danger] = "Error"
      render :new
    end
  end

  def edit

  end

  def update

  end

  def show

  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
