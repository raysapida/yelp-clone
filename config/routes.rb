Rails.application.routes.draw do
  root to: 'restaurants#index'
  devise_for :users
  resources :restaurants do
    collection do
      get 'search'
    end
    resources :reviews, except: [ :show, :index ]
  end
  get 'pages/about'
  get 'pages/contact'
end
