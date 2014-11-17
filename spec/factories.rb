FactoryGirl.define do
  factory :user do
    name 'User'
    email 'user@example.com'
    password 'password'
    password_confirmation 'password'
  end

  factory :pet do
    name 'Fido'
    age 1
    weight 15
    kind 'dog'
  end

  factory :veterinarian do
    name 'Test Vet'
    phone '555-555-5555'
    email 'test_vet@email.com'
    address '123 Main Street'
    user_id nil
  end
end
