Rails.application.routes.draw do

  #home page
  get '/', to: 'users#home', as: 'home'

###sessions
  get '/sign_in', to: 'sessions#new'

  post '/sessions', to: 'sessions#create'

  delete '/sessions', to: 'sessions#destroy'

# ###users
#   get "/users", to: "users#index", as: "users"

#   get "/users/new", to: "users#new", as: "new_user"

#   post "/users", to: "users#create"

#   get "/users/:id", to: "users#show
  patch '/users/:id/edit', to: 'users#update'


  resources :users, :exercises



end
