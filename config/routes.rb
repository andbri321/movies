Rails.application.routes.draw do
  root to:'movies#index'
  devise_for :users
  get 'profile', to: 'movies#profile'
  get 'home', to: 'movies#index'
  get 'new_movie', to: 'movies#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end