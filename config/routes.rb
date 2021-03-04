Rails.application.routes.draw do

  root to: 'products#index'
  #about_controller to: 'about#index'
  get '/about', to: 'about#index'
  resources :products, only: [:index, :show]
  resources :categories, only: [:show]

  resource :cart, only: [:show] do
    post   :add_item
    post   :remove_item
  end

  resources :orders, only: [:create, :show]

  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: [:edit, :update, :show]
    resources :categories, except: [:edit, :update, :show]
  end

  # These routes will be for signup. The first renders a form in thebrowse, the second will 
  # receive the form and create a user in our database using the datagiven to us by the user.
  
  # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

 
end
