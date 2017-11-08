Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :meals do
    resources :reviews, only: [:new, :create]
  end
  get '/dashboard', to: 'user#dashboard'

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

mount Attachinary::Engine => "/attachinary"
