class SessionsController < ApplicationController
  skip_before_action :ensure_login, only: [:new, :create]
  
  def new
  end

  def create
    user_info = params[:user]
    user = User.find_by(username: user_info[:username])
    if user && user.authenticate(user_info[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully."
    else
      redirect_to login_path, alert: "Invalid username/password."
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: "You have been logged out."
  end
end
