describe "the signin process", :type => :feature do

  it "signs me in" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    expect(page).to have_content 'Logged in'
  end

  it "gives a user an error who uses the wrong password" do
    user = FactoryGirl.create(:user)
    wrong_sign_in(user)
    expect(page).to have_content 'Email or password is invalid.'
  end
end
