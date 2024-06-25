Rails.application.routes.draw do
  devise_for :users#sign_up,sign_in,sign_out
  root to: 'posts#index'
  resources :posts
  resources :users
end

