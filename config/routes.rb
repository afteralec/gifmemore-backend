Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/cart_total', to: 'carts#total'
      resources :items, only: %i[ index ]
      resources :orders, only: %i[ create ]
      resources :users 
      
      get '/orders/user_history/:user_id', to: 'orders#orderHistory'
    end
  end
  # post '/cart/addItem', to: 'carts#addItem'
  # post '/cart/removeItem', to: 'carts#removeItem'
  post '/login', to: 'auth#create'
  post '/signup', to: 'users#create'

end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
