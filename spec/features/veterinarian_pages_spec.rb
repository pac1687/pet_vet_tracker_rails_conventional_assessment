describe "adding a veterinarian", :type => :feature do

  let(:user) { FactoryGirl.create(:user) }

  before(:each) do
    sign_in(user)
    visit veterinarians_path
  end

  it "adds a veterinarian" do
    new_veterinarian = FactoryGirl.build(:veterinarian)
    add_veterinarian(new_veterinarian)
    expect(page).to have_content "#{new_veterinarian.name} was added to the Pet Tracker."
  end

  it "shows an error when all fields aren't entered" do
    new_veterinarian = FactoryGirl.build(:veterinarian, phone: nil)
    add_veterinarian(new_veterinarian)
    expect(page).to have_content "Please fix these errors:"
  end
end

describe "editing a veterinarian", :type => :feature do

  let(:user)            { FactoryGirl.create(:user) }
  let(:current_user)    { user }
  let!(:veterinarian)   { FactoryGirl.create(:veterinarian, user_id: current_user.id) }

  before(:each) do
    sign_in(user)
    visit veterinarian_path(veterinarian)
  end

  it "updates a veterinarian" do
    click_link "Edit"
    fill_in 'veterinarian_phone', with: '666-666-6666'
    click_button "Update Veterinarian"
    expect(page).to have_content "#{veterinarian.name} was updated."
  end
end
