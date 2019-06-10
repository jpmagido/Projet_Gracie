Rails.application.routes.draw do

  get 'pages/Historique'
  get 'pages/CodeC'
  get 'pages/planning'
  get 'pages/static_lp'
  get 'pages/secret_page'
  get 'pages/admin_interface'
  root 'pages#landing_page'
  #root to: 'home#index'
  devise_for :users, controllers: {
  	omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' 
  }
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	devise_for :admins
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	resources :charges
	
	devise_for :users, controllers: {
	omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' 
	}
	
	scope '/admin' do
		resources :users
	end
  
end
