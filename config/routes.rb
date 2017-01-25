Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :events,   except: [:edit, :update]
  resources :comments, only: [:create, :destroy]

  post :like,   to: 'likes#create',  as: :like
  post :unlike, to: 'likes#destroy', as: :unlike

  authenticated :user do
    root to: 'home#index', as: 'home'
  end
  unauthenticated :user do
    root 'home#landing'
  end
end
