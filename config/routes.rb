Rails.application.routes.draw do
  resources :events
  devise_for :users
  resources :attendees

  get '/user/:id', to: 'users#profile', as: :user
  resources :users, only: :index

  root 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
