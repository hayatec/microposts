Rails.application.routes.draw do
  root to: 'static_pages#home'
  get    'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users do
    #resources :following, :followers
    get 'following' , to: 'users#following'
    get 'followers' , to: 'users#followers'
  end
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts
  resources :relationships, only: [:create, :destroy]
  
  #get 'following' , to: 'users#following'
  #get 'followers' , to: 'users#followers'
  #resources :following do
  #  resources :ads
  #end
end