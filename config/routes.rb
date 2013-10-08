Investours::Application.routes.draw do
  resource :dashboard, only: [:show]
  resources :entrepreneurs do
      resources :projects, only: [:show, :edit, :update]
  end
  resources :loans
  resources :payments
  resources :sign_ups
  resources :tours
  resources :updates, only: [:create, :update, :destroy]
  devise_for :users
  get 'users/search', to: "users#search"
  get 'home', to: "visitors#welcome"
  
  authenticated :user do
    root :to => "dashboards#show"
  end
  root to: "visitors#welcome"
end
