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
  devise_for :users
  post "/create_user",to: 'users#new'
  post '/login',to: 'authentication#login'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :products
  resources :categories
  # Defines the root path route ("/")
  # root "posts#index"
end
