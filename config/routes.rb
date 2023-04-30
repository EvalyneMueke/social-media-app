Rails.application.routes.draw do

  resources :sessions, only: [:create, :new, :destroy]
  resources :likes
  resources :comments
  resources :posts
  resources :users
  
  post "/login", to: "sessions#create"
  post "/signup", to: "users#create"
  delete "/logout", to: "sessions#destroy"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
