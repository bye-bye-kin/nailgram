Rails.application.routes.draw do
  devise_for :users,
    controllers:{registrations:'registrations'}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'

  get  "/arts"  => "arts#index"
  post "tweets"      => "tweets#create"

  get 'pages/home' => "pages#index"
  get 'pages/arts' => "pages#index" 
  
  get '/users/:id', to: 'users#show', as: 'user'
end
