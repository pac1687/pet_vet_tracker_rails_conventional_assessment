class UpdateVeterinarians < ActiveRecord::Migration
  def change
    change_column :veterinarians, :phone, :string
  end
end
