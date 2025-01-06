Rails.application.routes.draw do
  devise_for :bloggers

  root 'home#index'

  resources :posts , only: [:new, :create, :show, :index, :edit, :update]
  get 'posts/:id/delete', to: 'posts#delete_post', as: :delete_post
  get 'posts/:id/recycle', to: 'posts#recycle_post', as: :recycle_post
end
