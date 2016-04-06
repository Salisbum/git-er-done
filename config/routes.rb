Rails.application.routes.draw do
  root 'staticpages#index'
  devise_for :users
  resources :landmarks, only: [:new, :create, :index, :show]
end
