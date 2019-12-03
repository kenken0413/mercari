Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  resources :users, only: [:index, :destroy]
  resources :users, only: [:show] do
    collection do
      get :card_index
      get :card_registrations
      get :identification
      get :logout
    end
  end

  resources :items do
    collection do
      get 'category_children', defaults: { format: 'json' }
      get 'category_grandchildren', defaults: { format: 'json' }
    end
  end

  resources :credits, only: [:new,:create, :destroy] do
    collection do
      get :redirect_users_card_index
      get :redirect_registrations_end
    end
  end
  resources :items, only: [:index, :show, :create ] do
    resources :comments, only: [:create ]
    member do
      get 'buy_confirmation'
      post 'purchase'
      get 'purchase_done'
    end
  end

  resources :registrations do
    collection do
      get :n1
      get :n2
      get :n3
      get :end
    end
  end
end
