Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/orders/user_history/:user_id', to: 'orders#orderHistory'
  post '/cart/addItem', to: 'cart#addItem'
  post '/cart/removeItem', to: 'cart#removeItem'
end
