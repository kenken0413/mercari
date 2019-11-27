Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  resources :users, only: [:index, :destroy]
  resources :users, only: [:show] do
    collection do
      get :card_index
      get :card_registrations
    end
  end

  resources :items, only: [:index, :new, :edit, :show, :create ,:destroy] do
    collection do
      get 'category_children', defaults: { format: 'json' }
      get 'category_grandchildren', defaults: { format: 'json' }
    end
  end

  resources :credits, only: [:new,:create]

  resources :items, only: [:index, :show, :create ] do
    resources :comments, only: [:create ]
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
