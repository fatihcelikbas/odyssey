Rails.application.routes.draw do

  get 'wishlists/index'

  root 'pages#home'

  devise_for :travelers,
              path: '',
              path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'register'},
              controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}

  resources :travelers, only: [:show]

  resources :tours, except: [:edit] do
    member do
      get 'listing'
      get 'pricing'
      get 'description'
      get 'features'
      get 'location'
      get 'photo_upload'
      get 'preload'
    end
    resources :photos, only: [:create, :destroy]
    resources :reservations, only: [:create]
  end

  resources :guide_reviews, only: [:create, :destroy]
  resources :tourist_reviews, only: [:create, :destroy]

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  get '/your_trips' => 'reservations#your_trips'

  get '/your_reservations' => 'reservations#your_reservations'

  mount ActionCable.server, at: '/cable'
  get 'search' => 'pages#search'

  post '/add_to_wishlist' => 'wishlists#add_to_wishlist'
  delete '/delete_from_wishlist' => 'wishlists#delete_from_wishlist'

  resources :reservations, only: [:approve, :decline] do
    member do
      post '/approve' => "reservations#approve"
      post '/decline' => "reservations#decline"
    end
  end

  get '/payment_method' => "travelers#payment"
  get '/payout_method' => "travelers#payout"
  post '/add_card' => "travelers#add_card"

end
