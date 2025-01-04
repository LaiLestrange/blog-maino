Rails.application.routes.draw do
  devise_for :bloggers

  root 'home#index'

  resources :posts, only: [:new, :create, :show, :edit, :update]
end
