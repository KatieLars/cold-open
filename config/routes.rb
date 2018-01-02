Rails.application.routes.draw do
  root 'welcome#home'
  get '/about' => 'welcome#about'
  get '/auth/facebook/callback' => 'sessions#create'
  get '/auth/google/callback' => 'sessions#create'

  #resources :items, only: [:create, :update, :destroy]
  #resources :freezers, only: [:create, :update, :destroy]
  resources :users, only: [:new, :create, :update, :edit, :destroy, :show]
  resources :item_types

  resources :users, only: [:home] do
    resources :freezers
    resources :items
    get "/items/expiring_this_month" => "items#expiring_this_month", as: 'items_expire_month'
    get "/items_by_type" => "items#items_by_type", as: 'items_type'
  end

  get '/users/:id/home' => 'users#home', as: 'user_home'

  get '/signin' => "sessions#new", as: 'signin'
  post '/signin' => "sessions#create"
  delete '/signout' => "sessions#destroy", as: 'signout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
