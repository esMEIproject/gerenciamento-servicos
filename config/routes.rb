Rails.application.routes.draw do
  resources :materials
  resources :clientes
  resources :servicos
  resources :ajudantes
  resources :usuarios, only:[:new, :create, :show, :edit, :update, :destroy]
  get 'entrar', to: 'sessions#new'
  post 'entrar', to: 'sessions#create'
  delete 'sair', to: 'sessions#destroy'
  get 'servicos', to: 'servicos#index' #!! 
  
  root "sessions#new"
  #get 'sessions/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
