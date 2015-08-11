class WinsController < ApplicationController

  def index
    if logged_in?
      @win = Win.new
      @wins = Win.where(creator: current_user).where("created_at >= ?", Time.zone.now.beginning_of_day)
    else
      redirect_to login_path
    end
  end

  def create
    @win = Win.new(win_params)
    @win.creator = current_user
    @win.completed = false
    if @win.save
      flash[:success] = "Win created."
      redirect_to wins_path
    else
      render :index
    end
  end

  def edit
    @wins = Win.where(creator: current_user).where("created_at >= ?", Time.zone.now.beginning_of_day)
  end

  def update
    @win = Win.find(params[:id])
    if @win.update(win_params)
      redirect_to wins_path
    else

    end
  end

  def show

  end

  def destroy
    @win = Win.find(params[:id])
    @win.destroy
    redirect_to wins_path
  end

  private

  def win_params
    params.require(:win).permit(:body, :user_id, :completed)
  end

end
