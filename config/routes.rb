Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :pets do
    resources :bookings, only: [ :new, :create, :edit, :update, :show ]
  end

  get '/dashboard', to: 'dashboards#show'
  patch '/bookings/:id/status', to: 'bookings#change_status', as: :switch_bookings_status
  patch '/pets/:id/status', to: 'pets#change_status', as: :switch_pets_status
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
