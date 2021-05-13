Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in' #ゲストログイン
  end

  root to:"home#top"
  get '/mypage' => 'users#mypage'  #新規登録後orログイン後、マイページへ
  
  resources :users do
    collection do
      get 'search'
    end
  end

  resources :items do
    collection do
      get 'search'
    end
  end

  resources :conversations do
    resources :messages
  end
  
end
