Rails.application.routes.draw do
  resources :shops
  resources :socials
  resources :openings
  resources :contacts
  resources :postcards
  resources :abouts
  resources :priors
  resources :customers
  resources :additional_texts
  resources :additional_descriptions
  resources :featured_products
  resources :contact_infos
  resources :carts

  devise_for :users
  post "/create_user",to: 'users#new'
  post '/login',to: 'authentication#login'
  post '/get_current_user',to:'users#get_current_user'
  get '/categories_count',to: 'categories#select_by_count'
  post '/cart_items',to: 'carts#cart_items'
  post '/destroy_cart_items',to: 'carts#destroy_cart_items'

  post '/remove_image/:id',to: 'opening_images#remove_image'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :products
  resources :categories
  resources :shop_sliders
  # Defines the root path route ("/")
  # root "posts#index"
end
