class CreateTables < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.column :name, :string
      t.column :age, :integer
      t.column :weight, :integer
      t.column :type, :string

      t.timestamps
    end

    create_table :veterinarians do |t|
      t.column :name, :string
      t.column :phone, :integer
      t.column :email, :string
      t.column :address, :string

      t.timestamps
    end

    create_table :vet_appointments do |t|
      t.column :pet_id, :integer
      t.column :veterinarian_id, :integer
      t.column :description, :string
      t.column :notes, :string
      t.column :cost, :integer
      t.column :date, :timestamp

      t.timestamps
    end
  end
end
