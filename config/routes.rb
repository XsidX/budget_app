Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'users', to: 'devise/registrations#new'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "welcome#index"
  resources :categories, only: [:show, :index, :create]
  resources :transaction_entities, only: [:create]
end


