Rails.application.routes.draw do
  match('/', {:via => :get, :to => 'pets#index'})
  resources :pets do
    resources :vet_appointments, :except => [:index, :show]
  end
  match('veterinarians', {:via => :get, :to => 'veterinarians#index'})
  match('veterinarians', {:via => :post, :to => 'veterinarians#create'})
  match('veterinarians/new', {:via => :get, :to => 'veterinarians#index'})
  match('veterinarians/:id', {:via => :get, :to => 'veterinarians#show'})
  match('veterinarians/:id/edit', {:via => :get, :to => 'veterinarians#edit'})
  match('veterinarians/:id', {:via => [:patch, :put], :to => 'veterinarians#update'})
  match('veterinarians/:id', {:via => :delete, :to => 'veterinarians#destroy'})
end
