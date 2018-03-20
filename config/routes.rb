Rails.application.routes.draw do
  constraints AuthRedirect do
    devise_scope :contact do
        get '/auth/facebook/callback' => 'omniauth_callbacks#facebook'
        post '/auth/facebook/callback' => 'omniauth_callbacks#facebook'
    end
  end
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

    resources :performances do
      member do
        post   "performances", to: "performances#create_as_an_asso", as: 'as_an_asso'
      end
    end

    resources :videos do
      member do
        post   "videos", to: "videos#create_as_an_asso", as: 'as_an_asso'
      end
    end
    resources :assos, :places, :shops, :actus, :services
    resources :hardwares, except: :index
        # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end
