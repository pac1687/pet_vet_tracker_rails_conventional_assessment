describe Pet do
  it { should validate_presence_of :name }
  it { should validate_numericality_of :age }
  it { should validate_numericality_of :weight }
  it { should validate_presence_of :kind }
  it { should have_many :vet_appointments }
  it { should have_many :veterinarians }
  it { should belong_to :user }
end
