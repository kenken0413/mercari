Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'

  resources :users, only: [:index, :show]
  resources :items, only: [:index, :show] 

  resources :users, only: [:index]
  resources :users, only: [:show] do
    collection do
      get :card_index
      get :card_registrations
    end
  end
  resources :items, only: [:index, :show, :create ] do
    resources :comments, only: [:create ]
  end

  resources :registrations, only: [:index] do
    collection do
      get :n1
      get :n2
      get :n3
      get :n4
      get :end
    end 
  end
end
