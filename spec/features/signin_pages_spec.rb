describe "the signin process", :type => :feature do
  before :each do
    user = User.create(:name => 'User', :email => 'user@example.com', :password => 'password', :password_confirmation => 'password')
  end

  it "signs me in" do
    visit '/sessions/new'
    fill_in 'email', :with => 'user@example.com'
    fill_in 'password', :with => 'password'
    click_button 'Log In'
    expect(page).to have_content 'Logged in'
  end

  it "gives a user an error who uses the wrong password" do
    visit '/sessions/new'
    fill_in 'email', :with => 'user@example.com'
    fill_in 'password', :with => 'wrong'
    click_button 'Log In'
    expect(page).to have_content 'Email or password is invalid.'
  end
end