module ApplicationHelper

  # by putting this helpers i can use this device specific 
  # methods anywhere in the app

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
