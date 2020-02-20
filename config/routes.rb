Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :pets do
    resources :bookings, only: [ :new, :create, :edit, :update, :show ]
  end

  get '/dashboard', to: 'dashboards#show'

  patch '/bookings/:id/accept', to: 'bookings#accept', as: :switch_bookings_accept
  patch '/bookings/:id/deny', to: 'bookings#deny', as: :switch_bookings_deny


  patch '/pets/:id/status', to: 'pets#change_status', as: :switch_pets_status
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
