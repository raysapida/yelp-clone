Rails.application.routes.draw do
  root to: 'restaurants#index'
  resources :restaurants
  get 'pages/about'
  get 'pages/contact'
end
