Rails.application.routes.draw do
  devise_for :users, :controllers => { 
    registrations: "users/registrations"
    # , sessions: "users/sessions"
  }
  resources :users, only: [:show, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :users
  resources :images, only: [:show, :index]
  resources :comments, only: [:create,:destroy,:edit,:update]
  resources :favorites, only: [:create, :destroy]

  # make image index the 'home' page 
  root to: "images#index"

  # custom 'about' route 
  get 'about', to: 'static#about'
end
