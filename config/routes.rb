Rails.application.routes.draw do
  resources :landmarks, only: [:new, :create, :index, :show]
end
