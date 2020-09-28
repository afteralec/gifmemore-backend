Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :items, only: %i[ index ]
        get '/orders/user_history/:user_id', to: 'orders#orderHistory'
        post '/cart/addItem', to: 'cart#addItem'
        post '/cart/removeItem', to: 'cart#removeItem'
    end
  end

  post '/login', to: 'auth#create'
  post '/signup', to: 'users#create'
end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
