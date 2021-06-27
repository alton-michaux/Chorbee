# frozen_string_literal: true

Rails.application.routes.draw do
  resources :appointments
  resources :children
  resources :chores

  mount API::Base, at: '/'

  root to: 'children#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
