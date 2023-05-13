Rails.application.routes.draw do


  root 'users#index'

  get '/users', to: "users#index"
  get '/users/:id', to: "users#show"

  namespace :users do
    get '/users/:user_id/posts' to: "posts#index"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
