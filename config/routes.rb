Rails.application.routes.draw do
  devise_for :users
  resources :landmarks, only: [:new, :create, :index, :show]
end
