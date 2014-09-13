class VeterinariansController < ApplicationController
  def index
    @veterinarians = Veterinarian.all
    @veterinarian = Veterinarian.new
    render('veterinarians/index.html.erb')
  end

  def show
    @veterinarian = Veterinarian.find(params[:id])
    render('veterinarians/show.html.erb')
  end

  def create
    @veterinarian = Veterinarian.new(params[:veterinarian])
    if @veterinarian.save
      flash[:notice] = "#{@veterinarian.name} was added to the Pet Tracker."
      redirect_to("/veterinarians/#{@veterinarian.id}")
    else
      @veterinarians = Veterinarian.all
      render('veterinarians/index.html.erb')
    end
  end

  def edit
    @veterinarian = Veterinarian.find(params[:id])
    render('veterinarians/edit.html.erb')
  end

  def update
    @veterinarian = Veterinarian.find(params[:id])
    if @veterinarian.update(params[:veterinarian])
      flash[:notice] = "#{@veterinarian.name} was updated."
      redirect_to("/veterinarians/#{@veterinarian.id}")
    else
      render('veterinarians/edit.html.erb')
    end
  end

  def destroy
    @veterinarian = Veterinarian.find(params[:id])
    @veterinarian.destroy
    render('veterinarians/destroy.html.erb')
  end
end