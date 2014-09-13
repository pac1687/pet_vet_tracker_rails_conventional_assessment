Rails.application.routes.draw do
  match('/', {:via => :get, :to => 'pets#index'})
  resources :pets
  match('pets/:pet_id/vet_appointments/new', {:via => :get, :to => 'vet_appointments#new'})
  match('pets/:pet_id/vet_appointments', {:via => :post, :to => 'vet_appointments#create'})
  match('pets/:pet_id/vet_appointments/:vet_appointment_id/edit', {:via => :get, :to => 'vet_appointments#edit'})
  match('pets/:pet_id/vet_appointments/:vet_appointment_id', {:via => [:patch, :put], :to => 'vet_appointments#update'})
  match('pets/:pet_id/vet_appointments/:vet_appointment_id', {:via => :delete, :to => 'vet_appointments#destroy'})
  match('veterinarians', {:via => :get, :to => 'veterinarians#index'})
  match('veterinarians', {:via => :post, :to => 'veterinarians#create'})
  match('veterinarians/new', {:via => :get, :to => 'veterinarians#index'})
  match('veterinarians/:id', {:via => :get, :to => 'veterinarians#show'})
  match('veterinarians/:id/edit', {:via => :get, :to => 'veterinarians#edit'})
  match('veterinarians/:id', {:via => [:patch, :put], :to => 'veterinarians#update'})
  match('veterinarians/:id', {:via => :delete, :to => 'veterinarians#destroy'})
end
