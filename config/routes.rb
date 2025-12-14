Rails.application.routes.draw do
  get 'categories/index'

  get 'categories/show'

  get 'categories/new'

  get 'categories/edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'categories#index'
  resources :categories do
    resources :todos
  end

  resources :todos
end
