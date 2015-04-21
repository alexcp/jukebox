Rails.application.routes.draw do
  resources :artists, only: :show
  resources :venues, only: :show
  get "search", to: 'home#search'
  root to: 'home#index'
end
