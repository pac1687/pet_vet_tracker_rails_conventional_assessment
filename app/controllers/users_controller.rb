class UsersController < ApplicationController
  before_filter :authorize, only: [:show, :edit, :update]

  def index
    @users = User.all
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @pet = Pet.new
    @pets = @user.pets.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      render "index"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Account deleted."
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to :back, notice: "Account updated."
    else
      redirect_to :back, alert: "Update failed!"
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end