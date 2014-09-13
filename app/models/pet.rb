class Pet < ActiveRecord::Base
  validates :name, :presence => true
  validates :age, :presence => true
  validates :weight, :presence => true
  validates :kind, :presence => true
  has_many :vet_appointments
  has_many :veterinarians, through: :vet_appointments
end