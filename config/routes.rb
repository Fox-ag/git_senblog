Rails.application.routes.draw do
    devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root to: 'top#index'
    resources :users, only: [:show, :edit, :update] do
      member do
        get 'mypage'
      end
    end
    resources :blogs,  only: [:new, :create]
    resources :journals, only: [:new, :create]
end
