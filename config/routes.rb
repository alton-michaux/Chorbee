Rails.application.routes.draw do
  devise_for :parents

  resources :appointments
  resources :children
  resources :chores

  root to: 'parents#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
