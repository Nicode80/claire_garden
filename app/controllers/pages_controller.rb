class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  helper_method :resource_name, :resource, :devise_mapping, :resource_class

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def home
    if user_signed_in?
      redirect_to plants_path
    else
      redirect_to new_session_path(resource_name)
    end
  end
end
