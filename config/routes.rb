Rails.application.routes.draw do
  resources :bears
  resources :birds
  resources :pigs
  resources :deers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: redirect("/deers")
end
