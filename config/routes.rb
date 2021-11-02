# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  get :signup,  to: 'users#new'
  get :login,   to: 'sessions#new'

  resources :sessions, only: %i[create] do
    delete :destroy, on: :collection
  end

  resources :users, only: %i[create]
  resources :dealerships
  resources :cars
  resources :dealership_cars
end
