class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]
  before_action :set_trait_categories, only: %i[index show]

  def index
    @recipes = Recipe.includes(:creator, :proteins, :image_attachment, :recipe_traits, :traits).all
  end

  def show; end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params.merge(creator_id: Current.user.id))
    if @recipe.save
      redirect_to @recipe, notice: "Recipe was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: "Recipe was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_url, notice: "Recipe was successfully destroyed."
  end

  private

  def set_recipe
    @recipe = Recipe.includes(:source, :proteins, :image_attachment, :recipe_traits, :traits).find(params[:id])
  end

  def set_trait_categories
    @traits = Trait.categories.keys
  end

  def recipe_params
    params.expect(recipe: [ :name, :image, :servings, protein_ids: [], carbohydrate_ids: [], meal_ids: [], cuisine_ids: [] ])
  end
end
