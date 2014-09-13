Rails.application.routes.draw do
  match('/', {:via => :get, :to => 'pets#index'})
  resources :pets do
    resources :vet_appointments, :except => [:index, :show]
  end
  resources :veterinarians
end
