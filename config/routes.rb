Rails.application.routes.draw do
  root to:'all_movies#index'
  devise_for :users

  # resources :movies, only: [:new,:create,:destroy,:update]
  # resources :all_movies,only: %i[index]
  resources :all_movies
  resources :movies

  # get 'profile', to: 'movies#profile'
  #
  # get 'home', to: 'movies#index'
  # get 'new_movie', to: 'movies#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
