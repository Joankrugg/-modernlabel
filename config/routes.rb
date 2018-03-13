Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  mount Attachinary::Engine, at: 'attachinary'
  scope '(:locale)', locale: /fr|en/ do
    root to: 'pages#home'
    get 'pages/how_it_works'
    resources :users, only: [:show, :edit, :update] do
      collection do
        get 'action', to: "users#action"
      end
    end
    resources :artists do
      resources :ratings, only: :create
        collection do
          get 'signed', to: "artists#signed"
        end
      end
    resources :releases do
      resources :opinions, only: [ :new, :create ]
        collection do
          get 'signed', to: "releases#signed"
        end
      end
    resources :performances
    resources :assos do
      resources :services, only: [:create, :edit, :update, :destroy]
    end
    resources :places
    resources :shops
    resources :actus
    resources :videos
    resources :services
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end
