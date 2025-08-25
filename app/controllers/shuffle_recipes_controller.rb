class ShuffleRecipesController < ApplicationController
  before_action :set_shuffle
  before_action :set_shuffle_recipe, only: %i[show update]

  def index
  end

  def show
    @recipe = @shuffle_recipe.recipe
  end

  def update
    if @shuffle_recipe.update(status: params[:status].to_sym)
      redirect_to shuffle_shuffle_recipe_path(@shuffle, @shuffle.shuffle_recipes.where(position: @shuffle.current_index).first)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_shuffle
    @shuffle = Shuffle.includes(shuffle_recipes: [ recipe: [ :traits, :image_attachment ] ]).find(params[:shuffle_id])
  end

  def set_shuffle_recipe
    @shuffle_recipe = ShuffleRecipe.find(params[:id])
  end
end
