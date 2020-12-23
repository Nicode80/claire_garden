class PlantsController < ApplicationController

  def index
    # plants filter (dropdown and search)
    @plants = Plant.where(user_id: current_user.id)
    if params[:plant_query].present? && params[:plant_query] != ""
      @plants = @plants.search_by_name(params[:plant_query])
      @selected_category = "Tous"
    end
    if params[:plant_type].present? && params[:plant_type] != "Tous"
      @plants = @plants.where(category: params[:plant_type])
      @selected_category = params[:plant_type]
    end

    # for new plant modal
    @plant = Plant.new

    # tasks filter (calendar)
    months = ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Aout', 'Septembre', 'Octobre', 'Novembre', 'Décembre']
    @calendar_params = params.select { |_key, value| months.include? value }.keys.map(&:to_i)
    @tasks = @plants.map(&:tasks).flatten
    if @calendar_params.present?
      @tasks = @tasks.select { |task| overlap?(@calendar_params, task.months) }
    end
    respond_to do |format|
      format.html
      format.js
    end
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
    # raise
    @plant = Plant.find(params[:id])
    @task = Task.new
    if params[:season].present? && params[:season] != "Toutes"
      tasks = @plant.tasks
      @season = params[:season]
      @tasks = tasks.select { |task| task.season == params[:season] }
    else
      @tasks = @plant.tasks
    end
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
