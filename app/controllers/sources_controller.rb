class SourcesController < ApplicationController
  before_action :set_recipe
  before_action :set_source, only: %i[show edit update destroy]
  def show
    @source = Source.find(params[:id])
  end

  def new
    @source = @recipe.build_source
  end

  def create
    @source = @recipe.build_source(source_params)
    if @source.save
      redirect_to @recipe
    else
      render :new
    end
  end

  def edit; end

  def update
    if @source.update(source_params)
      redirect_to @source
    else
      render :edit
    end
  end

  def destroy
    @source.destroy
    redirect_to recipe_sources_path(@recipe)
  end

  private

  def set_source
    @source = Source.find(params[:id])
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def source_params
    params.require(:source).permit(:url, :note, :creator_id)
  end
end
