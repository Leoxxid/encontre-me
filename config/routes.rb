require 'sidekiq/web'

Rails.application.routes.draw do
  resources :match
  resources :combinations
  resources :information_types
  devise_for :users, :controllers => { registrations: 'registrations' }
  mount Sidekiq::Web => '/sidekiq' if Rails.env.development?
  root to: 'landing_page#index'
  get 'tags/:tag', to: 'users#index', as: :tag
  resources :dashboard, only: [:index, :show]
  resources :sugestions, only: [:show]
  put 'update-user-informations', to: 'users#update_user_informations'
end
