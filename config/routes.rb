Rails.application.routes.draw do
  resources :reviews, except: [ :show, :index ]
  devise_for :users
  root to: 'restaurants#index'
  resources :restaurants
  get 'pages/about'
  get 'pages/contact'
end
