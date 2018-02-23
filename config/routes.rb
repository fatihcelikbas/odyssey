Rails.application.routes.draw do
  get 'pages/home'

  devise_for :travelers
  root 'application#hello'
end