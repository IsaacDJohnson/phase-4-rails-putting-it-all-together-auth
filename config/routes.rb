Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "/signup", to: "users#create"
  post "login", to: "sessions#create"
  post "/recipes", to: "recipes#create"
  get "/recipes", to: "recipes#index"
  get "/me", to: "users#show"
  delete "logout", to: "sessions#destroy"

end
