Rails.application.routes.draw do
  get 'items/index'
  get 'items/show'
  get 'items/new'
  get 'items/edit'
  devise_for :users
  # root to: "home#index"
  root 'users#index' 
  resources :users
end
