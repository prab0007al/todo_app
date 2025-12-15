Rails.application.routes.draw do
  root 'categories#index'
  
  resources :categories do
    resources :todos, only: [:create, :update, :destroy]
  end
  
  resources :todos, only: [:create, :destroy]
end
