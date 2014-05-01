class UsersController < ApplicationController
	
	def index 
    @users = Users.all
  end

  def new
    @new_user = User.new
    @new_user.coupons.build
  end

  def create
    @new_user = User.new(user_params)
    if @new_user.save
      redirect_to users_path
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to users_path
    else
      redirect_to user_path
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @user.delete
      redirect_to users_path
    end
  end


  private

  def user_params
    params.require(:user).permit!
  end 
end

