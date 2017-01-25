Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: [:create]
  resources :events, only: [:new, :create]

  authenticated :user do
    root to: 'home#index', as: 'home'
  end
  unauthenticated :user do
    root 'home#landing'
  end
end
