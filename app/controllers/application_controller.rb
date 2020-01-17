class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  def current_user?(user)
  current_user == user
  end
 def first_login
      redirect_to new_session_path, notice: "Login First" unless session[:user_id] != nil
 end
  
class Forbidden < ActionController::ActionControllerError
end

  rescue_from Forbidden, with: :rescue403
  
  
end
