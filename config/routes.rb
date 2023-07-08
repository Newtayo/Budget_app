Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :categories do
    resources :payments
  end
end
  # Defines the root path route ("/")
  # root "articles#index"

  root 'users#index'
end
