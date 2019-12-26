Rails.application.routes.draw do
 
  root to: 'sessions#new'
  resources :blogs
 
  resources :blogs, only: [:new, :create, :edit, :destroy]
  resources :sessions, only: [:new, :create, :edit, :destroy]
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
