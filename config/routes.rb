Rails.application.routes.draw do
  devise_for :users,
    controllers:{registrations:'registrations'}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index'

  get  "/arts"  => "arts#index"
  post "tweets"      => "tweets#create"

  get 'pages/home' => "pages#index"
  get 'pages/arts' => "pages#index" 
  
  get '/users/:id', to: 'users#show', as: 'user'

  resources :posts, only: %i(new create index) do
    resources :photos, only: %i(create)
  end
  # onlyを使うと、自動で生成される7つのアクションのうちどのアクションのルーティングを追加するか絞り込むことができます。

  # またルーティングをネスト（入れ子）にすることで、親子関係をルーティングで表すことができます。photosに関してはpostsに対して「子」の関係になるので、ネストすることで、どの投稿に紐づくかを明示できます。
end
