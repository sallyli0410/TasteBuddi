Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/login', to: 'login#login', as: :login
      resources :products, only: [:index, :show, :create, :update, :destroy] do
        resources :reviews, only: [:create, :update, :destroy]
      end
      resources :users, only: [:show, :create] do
        resources :bookings, only: [:index, :create, :update]
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
