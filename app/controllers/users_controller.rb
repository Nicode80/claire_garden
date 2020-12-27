class UsersController < ApplicationController

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(plant_params)
    if @user.save
      flash[:notice] = "profil mis à jour"
      redirect_to plants_path
    else
      render :edit
    end
  end

  private

  def plant_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :photo
      )
  end
end
