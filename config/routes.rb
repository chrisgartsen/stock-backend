Rails.application.routes.draw do
  resources :users
  resources :items

  get 'email_validator/:email', to: 'users#unique_email?'
end
