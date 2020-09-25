Rails.application.routes.draw do
  root 'pets#index'

  resources :pets, only: [:index, :create, :edit, :update, :show]
  resources :pet_adoptions, only: [:create]

  get '*path', to: 'pets#index', via: :all
end
