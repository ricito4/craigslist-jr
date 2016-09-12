Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'categories#index'

  get '/articles/:url/created', to: "articles#secret"
  get '/articles/:url/edit', to: "articles#edit"
  put '/articles/:url/created', to: "articles#update"
  patch '/articles/:url/created', to: "articles#update"
  delete '/articles/:url/edit', to: "articles#destroy"

  resources :articles, except: [:index, :edit, :update, :destroy]
  resources :categories
end
