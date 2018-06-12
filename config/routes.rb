Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :conversations, only: [:create] do
    member do
      post :close
    end
  end
  mount ActionCable.server => '/cable'
end
