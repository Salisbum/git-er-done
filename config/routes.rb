Rails.application.routes.draw do
  root 'staticpages#index'

  devise_for :users

  authenticate :user do
      resources :landmarks do
        resources :reviews
      end

      resources :profiles
    end
  end
