class Devise::RegistrationsController < ApplicationController

  def new
    @user = User.new
  end


  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end


end  