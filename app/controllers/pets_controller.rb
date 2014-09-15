class PetsController < ApplicationController
  before_filter :authorize
  
  def index
    @pets = current_user.pets.all
    @pet = Pet.new
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      flash[:notice] = "#{@pet.name} was added to the Pet Tracker."
      redirect_to pet_path(@pet)
    else
      @pets = Pet.all
      render 'index'
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(pet_params)
      flash[:notice] = "#{@pet.name} was updated."
      redirect_to pet_path(@pet)
    else
      render 'edit'
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
  end

private

  def pet_params
    params.require(:pet).permit(:name, :age, :weight, :kind)
  end
end