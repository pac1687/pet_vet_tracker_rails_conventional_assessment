Rails.application.routes.draw do
  root :to => 'pets#index'
  resources :pets do
    resources :vet_appointments, :except => [:index, :show]
  end
  resources :veterinarians
end
