Rails.application.routes.draw do
  root 'staticpages#index'
  devise_for :users
  resources :landmarks

  get '/profiles/edit', to: redirect('/users/edit')
end
