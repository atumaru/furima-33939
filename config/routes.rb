# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: %i[new create index show]  
end
