Rails.application.routes.draw do
  root :to => 'sessions#new'
  resources :pets do
    resources :vet_appointments, :except => [:index, :show]
  end
  resources :veterinarians
  resources :sessions
  resources :users
end
