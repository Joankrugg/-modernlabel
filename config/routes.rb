Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :users, only: [:show, :edit, :update]
  resources :artists do
    resources :performances, only: [ :new, :create ]

      collection do
        get 'signed', to: "artists#signed"
    end
  end
  resources :releases
  resources :shops
  resources :actus
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
