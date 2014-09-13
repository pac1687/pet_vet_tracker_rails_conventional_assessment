class PetsController < ApplicationController
  def index
    @pets = Pet.all
    @pet = Pet.new
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def create
    @pet = Pet.new(params[:pet])
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
    if @pet.update(params[:pet])
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
end