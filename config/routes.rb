Rails.application.routes.draw do
  root 'staticpages#index'
  devise_for :users

  resources :landmarks do
    resources :reviews
  end

  resources :profiles, except: [:index]
  get '/profiles/edit', to: redirect('/users/edit')
end
