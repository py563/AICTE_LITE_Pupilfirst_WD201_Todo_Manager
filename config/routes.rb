Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get "todos", to: "todos#index"
  # post "todos", to: "todos#create"
  # get "todos/:id", to: "todos#show"

  resources :todos

  # get "users" to:"users#index"
  # post "users", to: "users#create"

  resources :users

  post "users/login", to: "users#login"
end
