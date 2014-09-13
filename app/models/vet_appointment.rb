class VetAppointment < ActiveRecord::Base
  validates :pet_id, :presence => true
  validates :veterinarian_id, :presence => true
  validates :description, :presence => true
  validates :cost, :presence => true
  validates :date, :presence => true
  belongs_to :pet
  belongs_to :veterinarian
end