Rails.application.routes.draw do
  resources :users
  resources :items

  get 'email_validator/:email', to: 'users#unique_email?'
  post 'login', to: 'users#login'
end
