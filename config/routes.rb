require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  root to: 'welcome#index'

  resources :buildings, only: [:index, :show, :new, :create] do
    get 'chart_data'
  end
  resources :utility_accounts, only: [:index, :new]
  resources :organizations, only: [:update]

  get :profile, to: 'welcome#profile'
  put :profile, to: 'welcome#update'

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  mount Sidekiq::Web => '/sidekiq'
end
