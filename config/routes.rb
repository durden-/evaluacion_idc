EvaluacionIdc::Application.routes.draw do

  get "evaluations/create"

  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :evaluations, :only => [:create]

  match '/signup',  :to => 'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'

  root :to => 'pages#home'
  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
end
