Rails.application.routes.draw do
  devise_for :parents

  resources :appointments do
    member do
      patch :toggle_complete
    end
  end
  resources :children
  resources :chores

  root to: 'parents#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
