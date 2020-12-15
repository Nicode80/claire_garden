class PlantsController < ApplicationController

  def index
    @plants = Plant.where(user_id: current_user.id)
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.user = current_user
    if @plant.save
      flash[:notice] = "Plante ajoutée"
      redirect_to plant_path(@plant)
    end
  end

  def show
    @plant = Plant.find(params[:id])
  end

  def update
    @plant = Plant.find(params[:id])
    @plant.update(plant_params)
    if @plant.save
      flash[:notice] = "plante mise à jour"
      redirect_to plant_path(@plant)
    end
  end

  private

  def plant_params
    params.require(:plant).permit(
      :name,
      :notes,
      :category,
      :photo)
  end
end
