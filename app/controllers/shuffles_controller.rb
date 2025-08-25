class ShufflesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @shuffle = Shuffle.new
  end

  private

  def set_shuffle
    @shuffle = Shuffle.find(params[:id])
  end

  def shuffle_params
    params.expect()
  end
end
