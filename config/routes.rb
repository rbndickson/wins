Wins::Application.routes.draw do

  root to: 'wins#index'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new' #login_path
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy' #logout_path

  resources :users, only: [:create, :edit, :update, :show]

  resources :wins, except: [:new] do
    member do
      put :complete # complete_win_path	PUT	/wins/:id/complete(.:format)
    end
  end

end
