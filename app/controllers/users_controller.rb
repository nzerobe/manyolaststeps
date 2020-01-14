class UsersController < ApplicationController
   before_action :authenticate_user, only: [:show]
#    before_action :ensure_correct_user, only: [:show]
  before_action :set_user, only: [:show]
  
  def new
    if logged_in?
      redirect_to user_path(current_user)
    else
      @user = User.new
    end
  end
  
 def create
    @user = User.new(user_params)
   if @user.save
      flash[:success] ='Signed up!!'
      log_in @user
      redirect_to @user
    else
      flash[:danger] ='Failed..'
      render 'new'
    end
  end
  
#  def show
#     @user = User.find(params[:id])
#   end
 
   def show
    if current_user == User.find(params[:id])
      @user = User.find(params[:id])
    else
      redirect_to(blogs_path, danger:"Not Your Page!!!")
    end
  end
  
  
    
     private

  def set_user
    @user = User.find(params[:id])
  end

  
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
  
 
  
end
