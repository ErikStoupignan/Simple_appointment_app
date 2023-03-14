Rails.application.routes.draw do
  root 'users#index'

  # resources :appointments, only: %i[new create]

  resources :users do
    resources :appointments
    # post 'create', to: 'appointments#create'
  end
end
