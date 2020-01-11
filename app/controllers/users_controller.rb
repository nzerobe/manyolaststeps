class UsersController < ApplicationController
  
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
  
  def show
    @user = User.find(params[:id])
  end
    
     private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
  
end
