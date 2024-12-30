Rails.application.routes.draw do
  resources :notes, path: '/'

  root to: 'notes#index'

  post 'set_timezone', to: 'application#set_timezone'
  
  post '/set_locale', to: 'locales#update', as: 'set_locale'
end