class VeterinariansController < ApplicationController
  def index
    @veterinarians = Veterinarian.all
    @veterinarian = Veterinarian.new
  end

  def show
    @veterinarian = Veterinarian.find(params[:id])
  end

  def create
    @veterinarian = Veterinarian.new(params[:veterinarian])
    if @veterinarian.save
      flash[:notice] = "#{@veterinarian.name} was added to the Pet Tracker."
      redirect_to veterinarian_path(@veterinarian)
    else
      @veterinarians = Veterinarian.all
      render 'index'
    end
  end

  def edit
    @veterinarian = Veterinarian.find(params[:id])
  end

  def update
    @veterinarian = Veterinarian.find(params[:id])
    if @veterinarian.update(params[:veterinarian])
      flash[:notice] = "#{@veterinarian.name} was updated."
      redirect_to veterinarian_path(@veterinarian)
    else
      render 'edit'
    end
  end

  def destroy
    @veterinarian = Veterinarian.find(params[:id])
    @veterinarian.destroy
  end
end