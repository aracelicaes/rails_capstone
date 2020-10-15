Rails.application.routes.draw do
  root 'articles#index'
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles do
    resource :vote, module: :articles, only: [:create, :destroy]
  end
  devise_for :users, path: 'auth'
  resources :users
end
