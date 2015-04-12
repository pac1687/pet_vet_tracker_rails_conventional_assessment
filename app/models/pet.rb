class Pet < ActiveRecord::Base
  validates :name, :presence => true
  validates :age, :numericality => true
  validates :weight, :numericality => true
  validates :kind, :presence => true
  validates :user_id, :numericality => true

  has_many :vet_appointments, dependent: :destroy
  has_many :veterinarians, through: :vet_appointments

  belongs_to :user
end
