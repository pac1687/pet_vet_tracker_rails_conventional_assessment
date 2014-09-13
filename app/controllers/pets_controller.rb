class PetsController < ApplicationController
  def index
    @pets = Pet.all
    @pet = Pet.new
    render('pets/index.html.erb')
  end

  def show
    @pet = Pet.find(params[:id])
    render('pets/show.html.erb')
  end

  def create
    @pet = Pet.new(params[:pet])
    if @pet.save
      flash[:notice] = "#{@pet.name} was added to the Pet Tracker."
      redirect_to("/pets/#{@pet.id}")
    else
      @pets = Pet.all
      render('pets/index.html.erb')
    end
  end

  def edit
    @pet = Pet.find(params[:id])
    render('pets/edit.html.erb')
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(params[:pet])
      flash[:notice] = "#{@pet.name} was updated."
      redirect_to("/pets/#{@pet.id}")
    else
      render('pets/edit.html.erb')
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    render('pets/destroy.html.erb')
  end
end