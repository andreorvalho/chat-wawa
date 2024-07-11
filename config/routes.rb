Rails.application.routes.draw do
  devise_for :users

  resources :chatrooms
  resources :messages

  root to: "chatrooms#index"
end
