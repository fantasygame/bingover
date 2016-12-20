Rails.application.routes.draw do
  resources :frazes
  devise_for :users

  root "frazes#index"
end
