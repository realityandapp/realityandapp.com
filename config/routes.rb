Raa::Application.routes.draw do
  resources :menus
  resources :categories
  resources :posts
  resources :pages
  root :to => "home#index"
  devise_for :admin_users
end
