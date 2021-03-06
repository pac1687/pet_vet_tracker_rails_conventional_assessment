class VetAppointmentsController < ApplicationController
  def new
    @veterinarians = Veterinarian.all
    @pet = Pet.find(params[:pet_id])
    @vet_appointment = @pet.vet_appointments.new
  end

  def create
    @pet = Pet.find(params[:pet_id])
    @vet_appointment = VetAppointment.new(vet_appointment_params)
    if @vet_appointment.save
      flash[:notice] = "Your vet appointment was added to the Pet Tracker."
      redirect_to pet_path(@pet)
    else
      @veterinarians = Veterinarian.all
      render 'new'
    end
  end

  def edit
    @veterinarians = Veterinarian.all
    @pet = Pet.find(params[:pet_id])
    @vet_appointment = VetAppointment.find(params[:id])
    render 'edit'
  end

  def update
    @pet = Pet.find(params[:pet_id])
    @vet_appointment = VetAppointment.find(params[:id])
    if @vet_appointment.update(vet_appointment_params)
      flash[:notice] = "Your vet appointment was updated."
      redirect_to pet_path(@pet)
    else
      render 'edit'
    end
  end

  def destroy
    @vet_appointment = VetAppointment.find(params[:id])
    @vet_appointment.destroy
    @pet = Pet.find(params[:pet_id])
  end

private

  def vet_appointment_params
    params.require(:vet_appointment).permit(:pet_id, :veterinarian_id, :description, :note, :cost, :date)
  end
end