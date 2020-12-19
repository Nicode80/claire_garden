class PlantsController < ApplicationController
# def index
#     if params[:plant_query].nil? || params[:plant_query] == ""
#       @plants = Plant.where(user_id: current_user.id)
#     else
#       @plants = Plant.where(user_id: current_user.id).search_by_name(params[:plant_query])
#     end
#     @plant = Plant.new
#     @tasks = @plants.map { |plant| plant.tasks }.flatten

#   end

  def index
    if params[:plant_query].present? && params[:plant_query] != ""
      @plants = Plant.where(user_id: current_user.id).search_by_name(params[:plant_query])
      @selected_category = "Tous"
    elsif params[:plant_type].present? && params[:plant_type] != "Tous"
      @plants = Plant.where(user_id: current_user.id).where(category: params[:plant_type])
      @selected_category = params[:plant_type]
    else
      @plants = Plant.where(user_id: current_user.id)
      @selected_category = "Tous"
    end
    # if params[:plant_type].nil? || params[:plant_type] == "Tous" || params[:plant_query] == ""
    #   @plants = Plant.where(user_id: current_user.id)
    #   @selected_category = "Tous"
    # elsif params[:plant_type]
    #   @plants = Plant.where(user_id: current_user.id).where(category: params[:plant_type])
    #   @selected_category = params[:plant_type]
    # elsif params[:plant_query].present?
    #   @plants = Plant.where(user_id: current_user.id).search_by_name(params[:plant_query])
    #   @selected_category = "Tous"

    # end
    @plant = Plant.new
    @tasks = @plants.map { |plant| plant.tasks }.flatten
    # respond_to do |format|
    #   format.html
    #   format.json { render json: { plants: @plants } }
    # end
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
    @task = Task.new
    @tasks = @plant.tasks
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
