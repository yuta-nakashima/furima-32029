Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "items#index"
  resources :users, only: :create
  resources :items, only: [:index, :new, :create, :show, :destroy] do
    resources :orders, only: [:create, :index, :new]
  end
end
