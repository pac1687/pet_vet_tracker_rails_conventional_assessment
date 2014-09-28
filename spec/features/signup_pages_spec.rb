require 'utilities'

describe "the sign up process", :type => :feature do

  it "signs me up" do
    user = User.new(:name => 'User', :email => 'user@example.com', :password => 'password', :password_confirmation => 'password')
    sign_up(user)
    expect(page).to have_content "Thank you for signing up!"
  end

  it "gives a user an error who doesn't fill in all the fields" do
    user = User.new(:name => 'User', :email => 'user@example.com', :password => 'password', :password_confirmation => 'password')
    wrong_sign_up(user)
    expect(page).to have_content "All fields are required." 
  end
end