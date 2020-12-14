class PlantsController < ApplicationController

  def index
    @plants = Plant.where(user_id: current_user.id)
    @user = current_user
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    @user = current_user
    @plant.user = @user
    if @plant.save
      flash[:notice] = "Plante ajoutée"
      redirect_to plant_path(@plant)
    end
  end

  def show
    @plant = Plant.find(params[:id])
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
