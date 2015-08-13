class WinsController < ApplicationController
  before_action :require_login

  def index
    @win = Win.new
    @wins = Win.where(creator: current_user).today
    @wins = Win.where(creator: current_user).reverse if params[:history].present?
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
    @wins = Win.where(creator: current_user).today
    @wins = Win.where(creator: current_user).reverse if params[:history].present?
  end

  def update
    @win = Win.find(params[:id])
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
    @win = Win.find(params[:id])
    @win.update(win_params)
    respond_to do |format|
      format.html do
        flash[:notice] = 'Updated'
        redirect_to :back
      end
      format.js
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
