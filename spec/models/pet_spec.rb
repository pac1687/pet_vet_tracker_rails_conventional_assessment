describe Pet do
  it { should validate_presence_of :name }
  it { should validate_presence_of :age }
  it { should validate_presence_of :weight }
  it { should validate_presence_of :kind }
  it { should have_many :vet_appointments }
  it { should have_many :veterinarians }
end