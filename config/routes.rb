Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :pets do
    resources :bookings, only: [ :new, :create, :edit, :update, :show ]
  end

  get '/dashboard', to: 'dashboards#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
