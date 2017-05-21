Rails.application.routes.draw do
  resources :users
  resources :posts
  post 'auth/facebook'
end