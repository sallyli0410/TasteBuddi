Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/login', to: 'login#login', as: :login
      resources :products
      resources :users, only: [:show, :create] do
        resources :bookings
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
