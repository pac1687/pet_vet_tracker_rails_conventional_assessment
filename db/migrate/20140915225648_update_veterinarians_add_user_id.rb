class UpdateVeterinariansAddUserId < ActiveRecord::Migration
  def change
    add_column :veterinarians, :user_id, :integer
  end
end
