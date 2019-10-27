require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  root to: 'welcome#index'

  resources :buildings, only: [:index, :show]
  resources :utility_accounts, only: [:index]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  mount Sidekiq::Web => '/sidekiq'
end
