Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  get '/sell', to: 'items#sell'
  get '/detail', to: 'items#detail'
  get '/buy', to: 'items#buy'

  get '/userpage', to: 'users#index'
end
