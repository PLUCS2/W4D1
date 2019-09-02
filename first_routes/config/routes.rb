Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show, :create, :update, :destroy]

  resources :artworks, only: [:index, :show, :create, :update, :destroy]

  resources :artwork_shares, only: [:show, :create, :destroy]

  get '/users/:user_id/artworks', to: 'artwork_shares#index'
  
  # get'/users?username=:username', to: 'users#index'

  resources :comments, only: [:create, :destroy]

  get '/users/:user_id/comments', to: 'comments#index'
  get '/artworks/:artwork_id/comments', to: 'comments#index'

end
