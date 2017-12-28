Rails.application.routes.draw do
  root 'welcome#home'
  get '/about' => 'welcome#about'
  get '/auth/facebook/callback' => 'sessions#create'
  get '/auth/google/callback' => 'sessions#create'

  resources :items, only: [:create, :update, :destroy]
  resources :freezers, only: [:create, :update, :destroy]

  resources :users, only: [:home] do
    resources :freezers, only: [:index, :new, :edit, :show]
    resources :items, only: [:index, :new, :edit, :show, :expiring_this_week, :expiring_this_month, :expired]
  end

  get '/users/:id/home' => 'users#home', as: 'user_home'

  get '/signin' => "sessions#new", as: 'signin'
  post '/signin' => "sessions#create"
  post '/signout' => "sessions#destroy", as: 'signout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
