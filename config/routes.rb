Rails.application.routes.draw do
  resources :materials
  root "sessions#new"
  #get 'sessions/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
