require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  root to: 'welcome#index'

  resources :buildings, only: [:index, :show] do
    get 'chart_data'
  end
  resources :utility_accounts, only: [:index, :new]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  mount Sidekiq::Web => '/sidekiq'
end
