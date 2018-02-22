Rails.application.routes.draw do
  resources :users
  resources :items

  get 'username_validator/:name', to: 'users#unique_name?'
end
