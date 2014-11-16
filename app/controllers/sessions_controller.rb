class SessionsController < ApplicationController

  def new
    if current_user.present?
      redirect_to pets_path
    end
  end

  def create
  user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to pets_path, notice: "Logged in!"
    else
      redirect_to :back, alert: "Email or password is invalid."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end