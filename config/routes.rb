Rails.application.routes.draw do

  resources :labels
  root 'users#new'
  resources :tasks
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  namespace :admin do
    resources :users, only:[:index, :edit, :update, :new, :create, :show, :destroy]
    resources :labels
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
