class Veterinarian < ActiveRecord::Base
  validates :name, :presence => true
  validates :phone, :presence => true
  validates :email, :presence => true
  validates :address, :presence => true
  has_many :vet_appointments, dependent: :destroy
  has_many :pets, through: :vet_appointments
  belongs_to :user
end