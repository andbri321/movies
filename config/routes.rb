Rails.application.routes.draw do
  root to:'all_movies#index'
  devise_for :users

  resources :all_movies,only: %i[index show]
  resources :movies
end
