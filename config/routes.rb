Rails.application.routes.draw do
 
  namespace :admin do
    get 'users/list'
    get 'users/edit'
    get 'users/index'
    get 'users/new'
    get 'users/show'
  end
  root to: 'blogs#index'
  resources :blogs
 
  resources :blogs, only: [:new, :create, :edit, :destroy]
  resources :sessions, only: [:new, :create, :edit, :destroy]
  resources :users
  
  namespace :admin do
    resources :users
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
