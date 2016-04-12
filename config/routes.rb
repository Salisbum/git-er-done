Rails.application.routes.draw do
  root 'staticpages#index'

  devise_for :users

  resources :landmarks do
    resources :reviews
  end

  resources :profiles
end
