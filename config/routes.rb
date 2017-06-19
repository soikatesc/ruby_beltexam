Rails.application.routes.draw do
  root 'users#new'
  post '/users' => 'users#create'

  post '/sessions' => 'sessions#create'
  delete 'sessions/:id' => 'sessions#destroy'

  get '/shoes' => 'products#index'
  get '/dashboard/:user_id' => 'products#dashboard'
  post '/products' => 'products#create'
  delete '/products/:product_id' => 'products#destroy'

  get '/purchases/:product_id' => 'purchases#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
