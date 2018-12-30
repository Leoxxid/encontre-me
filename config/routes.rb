require 'sidekiq/web'

Rails.application.routes.draw do
  resources :match
  resources :sugestions
  resources :dashboard
  resources :information_types
  devise_for :users
  mount Sidekiq::Web => '/sidekiq' if Rails.env.development?
  root 'landing_page#index'
end
