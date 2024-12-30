Rails.application.routes.draw do
  resources :notes
  root to: redirect("notes")

  post 'set_timezone', to: 'application#set_timezone'
end
