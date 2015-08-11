class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

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
      flash[:danger] = "Error in creating account"
      render :new
    end
  end

  def edit

  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your account was updated."
      redirect_to user_path
    else
      flash[:danger] = "Your account could not be updated."
      render :edit
    end
  end

  def show

  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
