describe "adding a pet", :type => :feature do

  let(:user) { FactoryGirl.create(:user) }

  before(:each) do
    sign_in(user)
  end

  it "adds a pet" do
    new_pet = FactoryGirl.build(:pet)
    add_pet(new_pet)
    expect(page).to have_content "#{new_pet.name} was added to the Pet Tracker."
  end

  it "shows an error when all fields aren't entered" do
    new_pet = FactoryGirl.build(:pet, kind: nil)
    add_pet(new_pet)
    expect(page).to have_content "Please fix these errors:"
  end
end

describe "editing a pet", :type => :feature do

  let(:user)            { FactoryGirl.create(:user) }
  let(:pet)             { FactoryGirl.create(:pet, user_id: user.id) }
  let(:current_user)    { user }
  let!(:veterinarian)   { FactoryGirl.create(:veterinarian, user_id: current_user.id) }

  before(:each) do
    sign_in(user)
    visit pet_path(pet)
  end

  it "updates a pet" do
    click_link "Edit"
    fill_in 'pet_age', with: 2
    click_button "Update Pet"
    expect(page).to have_content "#{pet.name} was updated."
  end

  it 'adds an appointment' do
    click_link "Add Appointment"
    add_appointment(pet)
    expect(page).to have_content "Your vet appointment was added to the Pet Tracker."
  end
end
