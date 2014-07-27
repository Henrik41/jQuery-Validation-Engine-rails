module ApplicationHelper
  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
  def resource_class
    devise_mapping.to
  end
  

    def simple_format(content)
      ERB.new(content).result(binding).html_safe
    end

    
end