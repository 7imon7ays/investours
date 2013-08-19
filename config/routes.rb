Investours::Application.routes.draw do
  devise_for :users
  root to: "visitors#welcome"
  resource :dashboard, only: [:show]
  resources :entrepreneurs
end
