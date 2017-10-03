Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  get 'pages/label'
  resources :users, only: [:show, :edit, :update]
  resources :artists do
    collection do
      get 'signed', to: "artists#signed"
    end
  end
  resources :releases
  resources :shops
  resources :actus
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
