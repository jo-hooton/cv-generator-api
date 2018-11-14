Rails.application.routes.draw do
  resources :users
  resources :cvs
  resources :text_items
  resources :lists
  resources :list_items
  resources :skills
  resources :contact_details
  get 'get_cvs', to: 'users#get_CV'
  post 'signin', to: 'users#sign_in'
  get 'validate', to: 'users#validate'
end
