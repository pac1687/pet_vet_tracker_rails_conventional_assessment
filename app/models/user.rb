class User < ActiveRecord::Base
  has_secure_password

  validates :name, :presence => true
  validates :password, :presence => { :on => :create }
  validates :password_confirmation, :presence => { :on => :create }
  validates :email, :presence => true
  validates_uniqueness_of :email

  has_many :pets
  has_many :veterinarians
end