Rails.application.routes.draw do
<<<<<<< HEAD
  
=======
  devise_for :guides, 
              path: 'guides',
              controllers: {sessions: 'guides/sessions', confirmations: 'guides/confirmations',
              passwords: 'guides/passwords', registrations: 'guides/registrations', 
              unlocks: 'guides/unlocks'}
  resources :guides, only: [:show]
>>>>>>> 7fbc3d80a6dc7177b670ed95674b62b34f723376
  root 'pages#home'

  devise_for :travelers,
              path: '',
              path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'register'},
              controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}
  
  resources :travelers, only: [:show]
  
<<<<<<< HEAD
  resources :tours, except: [:edit] do
    member do
      get 'listing'
      get 'pricing'
      get 'description'
      get 'features'
      get 'location'
    end
  end
=======
>>>>>>> 7fbc3d80a6dc7177b670ed95674b62b34f723376
end