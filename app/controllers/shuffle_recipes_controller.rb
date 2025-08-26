class ShuffleRecipesController < ApplicationController
  before_action :set_shuffle
  before_action :set_shuffle_recipe, only: %i[show update]

  def index
    @shuffle_recipes = @shuffle.shuffle_recipes
  end

  def show
    @recipe = @shuffle_recipe.recipe
  end

  def update
    if @shuffle_recipe.update(status: params[:status].to_sym)
      respond_to do |format|
        # format.html { redirect_to shuffle_shuffle_recipe_path(@shuffle, @shuffle.shuffle_recipes.where(position: @shuffle.current_index).first) }
        format.turbo_stream
      end
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
