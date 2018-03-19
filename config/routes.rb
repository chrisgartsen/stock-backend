Rails.application.routes.draw do
  resources :users
  resources :items

  post 'email_validator', to: 'users#unique_email?'
  post 'login', to: 'users#login'
  post 'register', to: 'users#create'
end
