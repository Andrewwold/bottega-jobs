Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/dice', to: "dice#index"

  root to: "jobs#index"

  get 'jobs', to:'jobs#index'
  get 'jobs/:id', to: 'jobs#show'

  # get '*unmatched_route', to: 'jobs#show'
end
