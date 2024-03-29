Rails.application.routes.draw do
  get '/top' => 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
  root to:"homes#top"
  devise_for :users
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  resources :users, only: [:show, :create, :edit, :index, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end