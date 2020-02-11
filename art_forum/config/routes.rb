Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: "users/registrations" }
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :users
  resources :images
  resources :comments

  # make image index the 'home' page 
  root to: "images#index"
end
