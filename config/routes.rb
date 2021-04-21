Rails.application.routes.draw do
  devise_for :users
  root to: "home#top"
  get '/mypage' => 'users#mypage'  #新規登録後orログイン後、マイページへ
  resources :users 
  resources :items
end
