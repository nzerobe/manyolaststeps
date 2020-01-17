module SessionsHelper
  
   def log_in(user)
    session[:user_id] = user.id
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
   def authenticate_user
    if current_user == nil
      redirect_to new_session_path, notice: "Login First"
    end
  end
  
  
  
  
  def logged_in?
    current_user.present?
  end
  
  
   
end
