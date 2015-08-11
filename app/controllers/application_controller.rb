class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :current_win_count

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in for access"
      redirect_to root_path
    end
  end

  def current_win_count
    Win.where(user_id: current_user).where("created_at >= ?", Time.zone.now.beginning_of_day).size
  end

end
