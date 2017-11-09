Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :meals do
    resources :reviews, only: [:create]
    resources :orders, only: [:create]
  end

  get 'accept/order/:id', to: 'orders#accept'
  get 'reject/order/:id', to: 'orders#reject'

  get '/dashboard', to: 'user#dashboard'


  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Attachinary::Engine => "/attachinary"
end

