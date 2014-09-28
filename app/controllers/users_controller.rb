class UsersController < ApplicationController
  before_filter :authorize, only: [:show, :edit, :update]

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
      session[:user_id] = @user.id
      redirect_to pets_path, notice: "Thank you for signing up!"
    else
      redirect_to :back, alert: "All fields are required." 
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
      redirect_to user_path(@user), notice: "Account updated."
    else
      redirect_to :back, alert: "Update failed!"
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end