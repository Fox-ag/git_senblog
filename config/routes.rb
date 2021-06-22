Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root to: 'top#index'
    resources :users, only: [:show, :edit, :update] do
      member do
        get 'mypage'
      end
    end
    resources :blogs,  only: [:index, :new, :create, :destroy, :edit, :update, :show] do
      collection do
        get 'search'
      end
      collection do
        get 'topmap'
      end
      member do
        get 'detailpage'
      end
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create, :destroy]
    end
    resources :journals, only: [:new, :create, :destroy, :edit, :update, :show]
end
