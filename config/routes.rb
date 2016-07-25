Rails.application.routes.draw do


  devise_for :users
  resources :cars

  resources :mileages, only: [:show, :create]

end
