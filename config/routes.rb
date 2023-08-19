Rails.application.routes.draw do
  # get '/home'
  get "/home", to: "home#index"
  # convention: get 'controller/function', to: 'controller#function'
  resources :articles


  root "home#index"


end
