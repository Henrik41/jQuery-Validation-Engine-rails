class CustomFailure < Devise::FailureApp
  def redirect_url
    
    if warden_options[:scope] == :user
        user_session_path
        
      else
        user_session_path
        
      end
      
  end

  def respond
    if http_auth?
      http_auth
    else
      redirect
    end
  end
end