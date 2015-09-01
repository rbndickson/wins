class WinsController < ApplicationController
  before_action :require_login
  before_action :find_win, only: [:update, :complete, :destroy]

  def index
    @win = Win.new
    set_win_list
  end

  def create
    @win = Win.new(win_params)
    @win.creator = current_user
    @win.completed = false
    if @win.save
      redirect_to wins_path
    else
      flash[:danger] = "Win cannot be blank"
      redirect_to wins_path
    end
  end

  def edit
    set_win_list
  end

  def update
    if @win.update(win_params)
      if params[:history].present?
       redirect_to wins_path(history: true)
      else
        redirect_to wins_path
      end
    else
      flash[:danger] = "Win cannot be blank"
      redirect_to :back
    end
  end

  def complete
    @win.update(win_params)
    respond_to do |format|
      format.html do
        flash[:notice] = 'Win updated'
        redirect_to :back
      end
      format.js
    end
  end

  def destroy
    if @win.created_at.to_date == Date.current
      @win.destroy
      redirect_to wins_path
    else
      @win.destroy
      redirect_to :back
    end
  end

  private

  def set_win_list
    if params[:history].present?
      @wins = Win.where(creator: current_user)
                 .not_today.order('created_at').reverse
    else
      @wins = Win.where(creator: current_user).today.order('created_at')
    end
  end

  def find_win
    @win = Win.find(params[:id])
  end

  def win_params
    params.require(:win).permit(:body, :user_id, :completed)
  end

end
