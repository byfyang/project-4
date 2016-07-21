Rails.application.routes.draw do

###home page
  get '/', to: 'users#home', as: 'home'

###sessions###
  get '/sign_in', to: 'sessions#new'

  post '/sessions', to: 'sessions#create'

  delete '/sessions', to: 'sessions#destroy'

###food###
  get '/food/search', to: 'foods#search_page'

  post '/food/search', to: 'foods#search_result'

  get '/food/exercise_form', to: 'foods#calculate_calories'

  post '/food/exercise_form', to: 'foods#create', as: 'new_food'

###users
  patch '/users/:id/edit', to: 'users#update'

  resources :users

end
