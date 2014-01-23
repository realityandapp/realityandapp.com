Raa::Application.routes.draw do
  resources :categories
  resources :posts
  resources :pages
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end
