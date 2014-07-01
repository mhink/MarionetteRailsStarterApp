Rails.application.routes.draw do
  root 'index#index'

  namespace :api do
    resources :contacts, only: [:index, :show, :create, :destroy]
  end
end
