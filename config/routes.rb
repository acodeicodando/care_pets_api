Rails.application.routes.draw do
  root 'pets#index'

  resources :pets, only: [:index, :create, :edit, :update, :show]

  get '*path', to: 'pets#index', via: :all
end
