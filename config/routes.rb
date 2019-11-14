Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'

  get '/userpage', to: 'users#mypage'
  get '/signin', to: 'users#login'
  get '/signup', to: 'users#signup'
  get '/signup/1', to:
end
