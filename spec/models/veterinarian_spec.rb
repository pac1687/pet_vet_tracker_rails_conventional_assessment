describe Veterinarian do
  it { should validate_presence_of :name }
  it { should validate_presence_of :phone }
  it { should validate_presence_of :email }
  it { should validate_presence_of :address }
  it { should have_many :vet_appointments }
  it { should have_many :pets }
end