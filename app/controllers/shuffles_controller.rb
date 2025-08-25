class ShufflesController < ApplicationController
  def index
  end

  def show
    @shuffle = Shuffle.find(params[:id])
  end

  def new
    @current_user = Current.user
    @shuffle = Shuffle.new
    @available_traits = Trait.where("recipe_traits_count > ?", 0)
  end

  def create
    @current_user = Current.user
    @shuffle = Shuffle.new(shuffle_params)

    if @shuffle.save
      redirect_to @shuffle, notice: "Shuffle was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_shuffle
    @shuffle = Shuffle.find(params[:id])
  end

  def shuffle_params
    params.expect(shuffle: [ :saved_recipes, protein_ids: [], cuisine_ids: [], meal_ids: [] ])
  end
end
