Rails.application.routes.draw do
  resources :frazes do
    collection do
      get :create_game
      get :game
      get :all_games
      get :toggle_check
    end
  end
  devise_for :users

  root "frazes#index"
end
