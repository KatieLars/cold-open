Rails.application.routes.draw do
  root 'welcome#home'
  get '/auth/facebook/callback' => 'sessions#create'
  get '/auth/google/callback' => 'sessions#create'
  
  resources :items
  resources :freezers
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
