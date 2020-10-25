Rails.application.routes.draw do

  get 'relationships/create'
  get 'relationships/destroy'
  get 'home/index'
  root to: "home#index"

  devise_for :users

  resources :articles do
    resource :favorites, only: [:create, :destroy]
  end

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
