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
        resources :releases, only: [:create, :edit, :update]
          resources :performances, only: [:create, :edit, :update]
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
    resources :assos
    resources :places
    resources :shops
    resources :actus
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end
