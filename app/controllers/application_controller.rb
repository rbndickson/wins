class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :current_win_count
  around_filter :user_time_zone, :if => :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_login
    if !logged_in?
      redirect_to login_path
    end
  end

  def require_current_user
    if params[:id].to_i != current_user[:id]
      flash[:danger] = "You do not have access"
      redirect_to root_path
    end
  end

  def current_win_count
    Win.where(user_id: current_user).today.size
  end

  def user_time_zone(&block)
    Time.use_zone(current_user.time_zone, &block)
  end
end
