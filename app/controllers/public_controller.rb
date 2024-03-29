class PublicController < ApplicationController
  skip_before_action :authenticate_user!
  helper_method :resource_name, :resource, :devise_mapping, :resource_class
  before_action :set_banner, only: [:index]

  def index

  end

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

  private

  def set_banner
    @show_banner = true
  end
end
