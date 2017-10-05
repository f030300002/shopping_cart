class UsersController < ApplicationController
  def index
    @users = User.find_users
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = 'create user succeed!'
      log_in @user
      current_user
      redirect_to user_path @user
    else
      flash[:warning] = 'create user failed!'
      render 'new'
    end
  end

  def show
    @user = User.find(params_id)
  end

  def edit
    @user = User.find(params_id)
  end

  def update
    @user = User.find(params_id)
    if @user.update(user_params)
      flash[:success] = 'update user succeed!'
      redirect_to user_path @user
    else
      flash[:warning] = 'update user failed!'
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params_id)
    @user.destroy
    flash[:success] = 'delete user succeed!'
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def params_id
    params[:id]
  end
end
