class PlantsController < ApplicationController

  def index
    # plants filter (dropdown and search)
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
    @plant = Plant.new

    # tasks filter (calendar)
    months = ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Aout', 'Septembre', 'Octobre', 'Novembre', 'Décembre']
    @calendar_params = params.select { |_key, value| months.include? value }.keys.map(&:to_i)
    if @calendar_params.present?
      tasks = @plants.map(&:tasks).flatten
      @tasks = tasks.select { |task| overlap?(@calendar_params, task.months) }
    else
      @tasks = @plants.map(&:tasks).flatten
    end
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

  def overlap?(params, task_months)
    overlap = false
    params.each { |number| overlap = task_months.include? number }
    overlap
  end
end
