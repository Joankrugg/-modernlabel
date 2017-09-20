Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'pages/label'
  resources :users, only: [:show, :edit, :update]
  resources :artists
  resources :releases
  resources :shops
  resources :actus
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
