Rails.application.routes.draw do
  resources :materials
  resources :clientes
  resources :servicos
  resources :ajudantes
  resources :usuarios
  get 'entrar', to: 'sessions#new'
  post 'entrar', to: 'session#create'
  
  root "sessions#new"
  #get 'sessions/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
