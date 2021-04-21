Rails.application.routes.draw do
  devise_for :users
  # root to: "home#index"
  root 'users#top' 
  resources :users
  resources :items
end
