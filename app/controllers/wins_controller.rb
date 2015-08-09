class WinsController < ApplicationController

  def index
    @win = Win.new
    @wins = Win.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end

  def create
    @win = Win.new(win_params)
    @win.user_id = current_user.id
    @win.completed = false
    if @win.save
      flash[:notice] = "Win created."
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
