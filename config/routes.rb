Rails.application.routes.draw do
    
    post   'likes/:post_id/create', to: "likes#create"
    get    'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :posts
    
    root   'users#index'
    
    get    '/signup',  to: 'users#new'
    #post  '/signup',  to: 'users#create'
    get    '/login',   to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'
    resources :users
end
