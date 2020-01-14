class Admin::UsersController < ApplicationController
  before_action :admin_required
  before_action :prohibited_admin_destroy, only: [:destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  PER = 10

  def index
    @users = User.all.includes(:blogs)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path(@user.id), notice: "Registered 【#{@user.name}】User"
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end


  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "User 【#{@user.name} Updated"
    end
  end
  
#   def update
#     respond_to do |format|
#       if @user.update(user_params)
#         format.html { redirect_to @user, notice: 'User was successfully updated.' }
#         format.json { render :show, status: :ok, location: @user }
#       else
#         format.html { render :edit }
#         format.json { render json: @user.errors, status: :unprocessable_entity }
#       end
#     end
#   end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: "User【#{@user.name}】Deleted"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end

  def admin_required
    if current_user.present?
      unless current_user.admin?
        redirect_to root_path, notice: "Not Authorized!!!"
      end
    end
  end

 
  def prohibited_admin_destroy
    if current_user.present?
      if current_user.admin? && current_user === @user
        redirect_to admin_users_path , notice: "Self Destruction No No No"
      end
    end
  end
end