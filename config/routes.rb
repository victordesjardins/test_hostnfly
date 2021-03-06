Rails.application.routes.draw do
  root to: 'pages#home'
  namespace :api, defaults: { format: :json } do
      namespace :v1 do
        resources :listings
        resources :bookings
        resources :reservations
        resources :missions, only: :index
      end
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
