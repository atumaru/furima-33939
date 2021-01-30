# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :orders, only: %i[create new index]
  end
end
