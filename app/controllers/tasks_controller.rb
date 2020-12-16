class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]

  def create
    @task = Task.new(task_params)
    @task.plant = Plant.find(params[:plant_id])
    if @task.save
      flash[:notice] = "Action ajoutée"
      redirect_to task_path(@task)
    end
  end

  def show
    @plant = @task.plant
    @season = @task.season
  end

  def update
    @task.update(task_params)
    if @task.save
      flash[:notice] = "Action mise à jour"
      redirect_to task_path(@task)
    end
  end

  def destroy
    @task.destroy
    redirect_to plant_path(@task.plant)
  end

  private

  def task_params
    params.require(:task).permit(
      :name,
      :start_date,
      :end_date,
      :periodicity,
      :content,
      :photo)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end



