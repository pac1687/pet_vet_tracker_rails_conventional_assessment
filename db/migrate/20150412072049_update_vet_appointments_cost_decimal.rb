class UpdateVetAppointmentsCostDecimal < ActiveRecord::Migration
  def change
    change_column :vet_appointments, :cost, :decimal, :precision => 8, :scale => 2
  end
end
