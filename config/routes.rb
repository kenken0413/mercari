Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'

  get '/userpage', to: 'users#mypage'
  get '/signin', to: 'users#login'

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
