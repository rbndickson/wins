class WinsController < ApplicationController

  def index
    if logged_in?
      @win = Win.new
      @wins = Win.where(user_id: current_user).where("created_at >= ?", Time.zone.now.beginning_of_day)
    else
      redirect_to login_path
    end
  end

  def create
    @win = Win.new(win_params)
    @win.user_id = current_user.id
    @win.completed = false
    if @win.save
      flash[:success] = "Win created."
      redirect_to wins_path
    else
      render :index
    end
  end

  def edit

  end

  def update

  end

  def show

  end

  private

  def win_params
    params.require(:win).permit(:body, :user_id, :status)
  end

end
