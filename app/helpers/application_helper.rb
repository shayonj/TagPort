module ApplicationHelper
  # Including dates helper
  include ActionView::Helpers::DateHelper
  
  def title
    base_title = "TagPort"
    return base_title if @title.nil?
    return "#{@title} | #{base_title}"
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
