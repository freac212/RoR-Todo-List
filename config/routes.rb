Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'lists/index'
  root 'lists#index'

  resources :lists, only: [:index, :new, :create, :destroy] do
    resources :todos, only: [:index, :new, :create, :destroy]
  end

  # Custom route to allow completion of todos
  resources :todos do
    member do
      put :complete
    end
  end

  resources :todos, only: [:index, :destroy]
end
