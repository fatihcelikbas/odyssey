Rails.application.routes.draw do
  
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

  get '/your_trips' => 'reservations#your_trips'
  
  get '/your_reservations' => 'reservations#your_reservations'
  
end