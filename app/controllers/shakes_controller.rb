class ShakesController < ApplicationController
  before_action :find_shake, only: [:edit, :update, :destroy]

  def index
    @shakes = Shake.ordered
  end

  def show
    @shake = Shake.find(params[:id])
  end

  def new
    @shake = Shake.new
  end

  def create
    @shake = Shake.new(object_params)
    if @shake.save
      redirect_to(shakes_path, notice: "#{ @shake.name } successfully created.")
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @shake.update(object_params)
      redirect_to(shakes_path, notice: "#{ @shake.name } successfully updated.")
    else
      render :edit
    end
  end

  def destroy
    @shake.destroy
    redirect_to(shakes_path, notice: "#{ @shake.name } successfully deleted.")
  end

  private def find_shake
    @shake = Shake.find(params[:id])
  end

  private def object_params
    params.require(:shake).permit(:name, {ingredient_ids: []})
  end
end
