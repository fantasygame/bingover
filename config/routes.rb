Rails.application.routes.draw do
  resources :frazes do
    collection do
      get :create_game
      get :game
    end
  end
  devise_for :users

  root "frazes#index"
end
