class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:danger] = 'Login error, please try again.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:warning] = 'You have logged out'
    redirect_to root_path
  end
end
