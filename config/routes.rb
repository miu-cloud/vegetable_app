Rails.application.routes.draw do
  devise_for :users
  # root to: "home#index"
  root 'users#index' 
  resources :users
  resources :items
end
