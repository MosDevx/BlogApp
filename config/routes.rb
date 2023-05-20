Rails.application.routes.draw do

      # devise_for :users


  root 'users#index'

  # get '/users', to: "users#index"
  # get '/users/:id', to: "users#show", as:'user'
  resources :users do
    resources :posts do
      resources :likes, only: [:create]
      resources :comments
    end
  end

  # get 'users/:user_id/posts', to: "posts#index" , as:'user_posts'
  # get 'users/:user_id/posts/:id', to: "posts#show" , as:'user_post'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
