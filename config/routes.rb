Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :plants, only: [:index, :create, :show, :update] do
    resources :tasks, only: [:create]
  end

  resources :tasks, only: [:show, :update, :destroy ]

  resources :users, only: [:edit, :update]
end
