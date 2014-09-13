class Update < ActiveRecord::Migration
  def change
    rename_column :vet_appointments, :notes, :note
  end
end
