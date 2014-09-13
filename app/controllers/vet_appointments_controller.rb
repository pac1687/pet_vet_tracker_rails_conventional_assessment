class VetAppointmentsController < ApplicationController
  def new
    @veterinarians = Veterinarian.all
    @pet = Pet.find(params[:pet_id])
    @vet_appointment = @pet.vet_appointments.new
    render('vet_appointments/new.html.erb')
  end

  def create
    @pet = Pet.find(params[:pet_id])
    @vet_appointment = VetAppointment.new(params[:vet_appointment])
    if @vet_appointment.save
      flash[:notice] = "Your vet appointment was added to the Pet Tracker."
      redirect_to("/pets/#{@pet.id}")
    else
      @veterinarians = Veterinarian.all
      render('vet_appointments/new.html.erb')
    end
  end

  def edit
    @veterinarians = Veterinarian.all
    @pet = Pet.find(params[:pet_id])
    @vet_appointment = VetAppointment.find(params[:vet_appointment_id])
    render('vet_appointments/edit.html.erb')
  end

  def update
    @pet = Pet.find(params[:pet_id])
    @vet_appointment = VetAppointment.find(params[:vet_appointment_id])
    if @vet_appointment.update(params[:vet_appointment])
      flash[:notice] = "Your vet appointment was updated."
      redirect_to("/pets/#{@pet.id}")
    else
      render('vet_appointments/edit.html.erb')
    end
  end

  def destroy
    @vet_appointment = VetAppointment.find(params[:vet_appointment_id])
    @vet_appointment.destroy
    @pet = Pet.find(params[:pet_id])
    render('vet_appointments/destroy.html.erb')
  end
end