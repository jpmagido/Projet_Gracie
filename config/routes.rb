Rails.application.routes.draw do
  get 'pages/static_lp'
  get 'pages/admin_interface'
  root 'pages#landing_page'
  #root to: 'home#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :charges
  
end
