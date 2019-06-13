Rails.application.routes.draw do
  
  
	get 'pages/static_lp'
	get 'pages/secret_page'
	get 'pages/admin_interface'
	post 'pages/admin_interface', to: 'pages#admin_interface'
	get 'pages/home_page'
	root 'pages#landing_page'
	#root to: 'home#index'

	devise_for :admins, controllers: { registrations: 'admins/registrations' }
	
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	resources :charges
	
	devise_for :users, controllers: {
	omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations', sessions: 'users/sessions' 
	}
	
	scope '/admin' do
		resources :users
	end
  
end
