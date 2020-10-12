Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles
  devise_for :users
  resources :users
  root 'articles#index'
end
