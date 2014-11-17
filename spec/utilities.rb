def sign_in(user)
  visit '/sessions/new'
  fill_in 'email', with: user.email
  fill_in 'password', with: user.password
  click_button "Log In"
end

def wrong_sign_in(user)
  visit "/sessions/new"
  fill_in 'email', with: user.email
  fill_in 'password', with: 'wrong password'
  click_button "Log In"
end

def sign_up(new_user)
  visit "/users/new"
  fill_in 'user_name', with: new_user.name
  fill_in 'user_email', with: new_user.email
  fill_in 'user_password', with: new_user.password
  fill_in 'user_password_confirmation', with: new_user.password_confirmation
  click_button "Create User"
end

def wrong_sign_up(new_user)
  visit "/users/new"
  fill_in 'user_name', with: new_user.name
  fill_in 'user_password', with: new_user.password
  fill_in 'user_password_confirmation', with: new_user.password_confirmation
  click_button "Create User"
end

def add_pet(new_pet)
  fill_in 'pet_name', with: new_pet.name
  fill_in 'pet_age', with: new_pet.age
  fill_in 'pet_weight', with: new_pet.weight
  fill_in 'pet_kind', with: new_pet.kind
  click_button "Create Pet"
end

def add_appointment(pet)
  fill_in 'vet_appointment_description', with: 'Shots'
  fill_in 'vet_appointment_note', with: "#{pet.name} needs his annual shots."
  fill_in 'vet_appointment_cost', with: 75
  fill_in 'vet_appointment_date', with: '2014-11-24'
  click_button "Create Vet appointment"
end
