require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  mount Sidekiq::Web => '/sidekiq' if Rails.env.development?
  root 'landing_page#index'
end
