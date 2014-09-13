describe VetAppointment do
  it { should validate_presence_of :pet_id }
  it { should validate_presence_of :veterinarian_id }
  it { should validate_presence_of :description }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :date }
  it { should belong_to :pet }
  it { should belong_to :veterinarian }
end