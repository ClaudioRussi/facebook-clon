Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations:'users/registrations' }

  devise_scope :user do
    get 'sign_up', to: 'users/registrations#new'
    get 'sign_in', to: 'users/sessions#new'
  end

  get 'friend_requests', to: 'users#received_friend_requests', as: "received_friend_requests"

  post 'confirm/:id', to:'friend_requests#confirm', as: "confirm"

  post 'like/:id', to:'posts#like', as: "like"

  resources :friend_requests

  resources :users, only:[:show]

  resources :posts do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"
end
