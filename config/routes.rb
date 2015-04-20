Rails.application.routes.draw do
  resources :artists, only: :show

  root to: 'home#index'
end
