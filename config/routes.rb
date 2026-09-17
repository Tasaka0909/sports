Rails.application.routes.draw do
  devise_for :users, controllers: {
  registrations: "users/registrations"
  }

  authenticated :user do
    root to: 'users#show', as: :user_root
  end

  unauthenticated do
    root to: 'tweets#index', as: :unauthenticated_root
  end

  resources :users, only: [:show]

  resources :tweets do
    resources :comments, only: [:create]
  end

  resources :perfumes

end