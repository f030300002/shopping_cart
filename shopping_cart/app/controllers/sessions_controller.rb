class SessionsController < ApplicationController
  def new

  end

  def create

    @user = User.where(email: params[:session][:email].downcase).first
    if @user && @user.authenticate(params[:session][:password])
      flash[:success] = "login successful!"
      log_in @user
      current_user
      redirect_to user_path @user
    else
      flash[:danger] = "Email or Password wrong!"
      render 'new'
    end

  end

  def destroy
    log_out
    redirect_to root_path
  end

end
