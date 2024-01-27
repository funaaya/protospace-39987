Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"
  get 'prototypes/new', to: 'prototypes#new'
  resources :prototypes, only: [:index, :new, :create, :show, :edit, :update, :destroy]do
 
  end
  resources :users, only: :show

  resources :prototypes do
    resources :comments, only: :create
  end
  
end
