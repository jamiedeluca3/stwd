Postit::Application.routes.draw do
  root to: 'posts#index'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # Standard routes template, remove DELETE from routes
  resources :posts, except: [:delete] do
    # Create vote path
    member do
      post 'vote'
    end
  	resources :comments, only: [:create] do
      # Create vote path
      member do
        post 'vote'
      end
    end
  end

  resources :users, only: [:create]
  resources :categories, only: [:show, :new, :create]
end
