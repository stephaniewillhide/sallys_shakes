class IngredientsController < ApplicationController
  before_action :find_ingredient, only: [:edit, :update, :destroy]

  def index
    @ingredients = Ingredient.ordered
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(object_params)
    if @ingredient.save
      redirect_to(ingredients_path, notice: "#{ @ingredient.name } successfully created.")
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @ingredient.update(object_params)
      redirect_to(ingredients_path, notice: "#{ @ingredient.name } successfully updated.")
    else
      render :edit
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to(ingredients_path, notice: "#{ @ingredient.name } successfully deleted.")
  end

  private def find_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  private def object_params
    params.require(:ingredient).permit(:name, :calories)
  end
end
