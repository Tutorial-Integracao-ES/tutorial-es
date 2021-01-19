Rails.application.routes.draw do
  resources :complaints
  resources :users, only: [:new, :create]
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get '', to: 'complaints#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
