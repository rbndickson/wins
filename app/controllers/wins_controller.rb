class WinsController < ApplicationController

  def index
    @win = Win.new
    @wins = Win.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def show

  end

end
