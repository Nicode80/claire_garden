class TasksController < ApplicationController

  def create
    @task = Task.new(task_params)
    @task.plant = Plant.find(params[:plant_id])
    if @task.save
      flash[:notice] = "Action ajoutée"
      redirect_to task_path(@task)
    end
  end

  def show
    @task = Task.find(params[:id])
    @plant = @task.plant
    @season = season(@task)
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    if @task.save
      flash[:notice] = "Action mise à jour"
      redirect_to task_path(@task)
    end
  end

  def destroy
    @task = Task.find(params[:id])
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
