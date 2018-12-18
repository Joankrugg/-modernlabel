Rails.application.routes.draw do
  mount Notifications::Engine => "/notifications"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers:
    { omniauth_callbacks: 'users/omniauth_callbacks' }
  mount Attachinary::Engine, at: 'attachinary'
  scope '(:locale)', locale: /fr|en/ do
    root to: 'pages#home'
    get 'pages/chat'
    get 'pages/rock_map'
    get 'pages/cgu'
    resources :users, only: [:show, :edit, :update, :destroy] do
      collection do
        get 'action', to: "users#action"
        resources :topics do
          resources :comments, only: :create
        end
      end
    end
    get 'pages/chat'
    mount ActionCable.server =>"/cable"
    resources :artists do
      resources :ratings, only: :create
      resources :instagrams, only: :create
      resources :soundclouds, only: :create
      resources :twitters, only: :create
      resources :youtubes, only: :create
      resources :bandcamps, only: :create
      resources :facebooks, only: :create
      resources :bios, only: :create
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

    resources :performances do
      member do
        post   "performances", to: "performances#create_as_an_asso", as: 'as_an_asso'
      end
    end

    resources :videos do
      collection do
        get 'signed', to: "videos#signed"
      end
      member do
        post   "videos", to: "videos#create_as_an_asso", as: 'as_an_asso'
      end
    end
    resources :shops, only: [:index, :show]
    resources :actus, only: [:index, :show]
    resources :contacts
    resources :assos, :places, :services
    resources :hardwares, except: :index
        # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end
