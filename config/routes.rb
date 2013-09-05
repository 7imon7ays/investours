Investours::Application.routes.draw do
  resource :dashboard, only: [:show]
  resources :entrepreneurs
  resources :sign_ups
  resources :tours
  devise_for :users

  root to: "visitors#welcome"
end
