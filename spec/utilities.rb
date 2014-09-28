def sign_in(user)
  visit '/sessions/new'
  fill_in 'email', :with => user.email
  fill_in 'password', :with => user.password
  click_button "Log In"
end

def wrong_sign_in(user)
  visit "/sessions/new"
  fill_in 'email', :with => user.email
  fill_in 'password', :with => 'wrong password'
  click_button "Log In"
end

def sign_up(new_user)
  visit "/users/new"
  fill_in 'user_username', :with => new_user.username
  fill_in 'user_password', :with => new_user.password
  fill_in 'user_password_confirmation', :with => new_user.password_confirmation
  click_button "Sign Up"
end