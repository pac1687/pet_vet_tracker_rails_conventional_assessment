describe "the sign up process", :type => :feature do

  it "signs me up" do
    user = FactoryGirl.build(:user)
    sign_up(user)
    expect(page).to have_content "Thank you for signing up!"
  end

  it "gives a user an error who doesn't fill in all the fields" do
    user = FactoryGirl.create(:user)
    wrong_sign_up(user)
    expect(page).to have_content "All fields are required."
  end
end
