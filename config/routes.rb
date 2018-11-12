Rails.application.routes.draw do
  resources :users
  resources :cvs
  resources :text_items
  resources :lists
  resources :list_items
  resources :skills
  resources :contact_details
  post 'signin', to: 'users#sign_in'
  post 'cvs', to: 'cvs'
  
  get 'validate', to: 'users#validate'
end
