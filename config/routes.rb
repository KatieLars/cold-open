Rails.application.routes.draw do
  root 'welcome#home'
  get '/about' => 'welcome#about'
  get '/auth/facebook/callback' => 'sessions#create'
  get '/auth/google/callback' => 'sessions#create'

  resources :items
  resources :freezers
  resources :users
  get '/users/:id/home' => 'users#home', as: 'user_home'

  get '/signin' => "sessions#new", as: 'signin'
  post '/signin' => "sessions#create"
  post '/signout' => "sessions#destroy", as: 'signout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
