Rails.application.routes.draw do
  resources :artists, only: :show
  resources :venues, only: :show

  root to: 'home#index'
end
