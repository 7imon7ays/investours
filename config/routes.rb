Investours::Application.routes.draw do
  resource :dashboard, only: [:show]
  resources :entrepreneurs do
    resources :projects
  end
  resources :sign_ups
  resources :tours
  devise_for :users


  authenticated :user do
    root :to => "dashboards#show"
  end
  root to: "visitors#welcome"
end
