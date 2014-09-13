class UpdatePets < ActiveRecord::Migration
  def change
    rename_column :pets, :type, :kind
  end
end
