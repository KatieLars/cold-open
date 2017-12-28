Rails.application.routes.draw do
  root 'welcome#home'
  get '/about' => 'welcome#about'
  get '/auth/facebook/callback' => 'sessions#create'
  get '/auth/google/callback' => 'sessions#create'

  resources :items, only: [:create, :update, :destroy]
  resources :freezers, only: [:create, :update, :destroy]
  resources :users, only: [:new, :create, :update, :edit, :destroy]

  resources :users, only: [:home] do
    resources :freezers, only: [:index, :new, :edit, :show]
    resources :items, only: [:index, :new, :edit, :show]
    get "/items/expiring_this_month" => "items#expiring_this_month", as: 'items_expire_month'
    get "/items/expiring_this_week" => "items#expiring_this_week", as: 'items_expire_week'
    get "/items/expired" => "items#expired", as: 'items_expired'
  end

  get '/users/:id/home' => 'users#home', as: 'user_home'

  get '/signin' => "sessions#new", as: 'signin'
  post '/signin' => "sessions#create"
  post '/signout' => "sessions#destroy", as: 'signout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
