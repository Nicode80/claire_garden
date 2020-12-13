class PlantsController < ApplicationController

  def index
    @plants = Plant.where(user_id: current_user.id)
  end

end
