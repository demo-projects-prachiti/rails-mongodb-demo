Rails.application.routes.draw do
  devise_for :users
  resources :comments
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end
  resources :users, controllers: { registrations: 'users/registrations' }
  resources :articles
  root 'articles#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
