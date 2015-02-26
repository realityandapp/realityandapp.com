Raa::Application.routes.draw do
  get 'pages/:id.html' => 'pages#show', as: :page
  resources :links
  resources :menus
  resources :categories
  resources :posts
  resources :pages
  root :to => "home#index"
  devise_for :admin_users
end
