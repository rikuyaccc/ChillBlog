Rails.application.routes.draw do

  get 'home/index'
  root to: "home#index"

  devise_for :users
  resources :users
  resources :articles


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
