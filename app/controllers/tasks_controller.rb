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
    @season = season(@task)
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

  def season(task)
    start_month = task.start_date.month
    end_month = task.end_date.month
    case mean_month(start_month, end_month)
    when 1..3
      "Hiver"
    when 4..6
      "Printemps"
    when 7..9
      "Eté"
    when 9..12
      "Automne"
    end
  end

  def mean_month(start_month, end_month)
    if start_month <= end_month
      (start_month + end_month) / 2
    elsif start_month > end_month && (start_month + end_month) > 12
      start_month + end_month - 12
    else
      start_month + end_month
    end
  end
end



