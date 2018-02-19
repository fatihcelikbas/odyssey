Rails.application.routes.draw do
  devise_for :travelers
  root 'application#hello'
end