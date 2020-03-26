Rails.application.routes.draw do
    
    resources :posts
    
    #resources :likes, only: [:create, :destroy]
    #post "likes/:post_id/create", to: "likes#create"
    #post "likes/:post_id/destroy", to: "likes#destroy"
    
    resources :posts do
      resources :likes, only: [:create, :destroy]
    end
    
    get    'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    
    root   'users#index'
    
    get    '/signup',  to: 'users#new'
    #post  '/signup',  to: 'users#create'
    get    '/login',   to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'
    resources :users
    
    get 'users/:id/likes', to: 'users#likes', as: 'user_likes'
end
