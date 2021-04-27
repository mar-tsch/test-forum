Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  resources :users
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments
  end
end
