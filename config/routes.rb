Rails.application.routes.draw do
  devise_for :guides, 
              path: 'guides',
              controllers: {sessions: 'guides/sessions', confirmations: 'guides/confirmations',
              passwords: 'guides/passwords', registrations: 'guides/registrations', 
              unlocks: 'guides/unlocks'}
  resources :guides, only: [:show]
  root 'pages#home'

  devise_for :travelers,
              path: '',
              path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'register'},
              controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}
  
  resources :travelers, only: [:show]
  
end