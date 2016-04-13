Rails.application.routes.draw do
  root 'staticpages#index'

  devise_for :users

  resources :landmarks do
    resources :reviews
  end

  resources :profiles

  resources :reviews do
    resources :votes do
      collection do
        post 'upvote'
        post 'downvote'
      end
    end
  end
end
