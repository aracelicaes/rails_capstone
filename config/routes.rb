Rails.application.routes.draw do
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles do
    resource :vote, module: :articles
  end
  devise_for :users, path: 'auth'
  resources :users
  root 'articles#index'
end
