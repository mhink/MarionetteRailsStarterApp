Rails.application.routes.draw do
  root 'index#index'

  namespace :api do
    resources :contacts, only: :index
  end
end
