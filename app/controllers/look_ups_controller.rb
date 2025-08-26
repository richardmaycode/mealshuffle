class LookUpsController < ApplicationController
  def new
  end

  def create
    @shuffle = Shuffle.find_by(share_token: params[:share_token])
    if !@shuffle.nil?
      redirect_to @shuffle
    else
      render :new, status: :not_found
    end
  end
end
