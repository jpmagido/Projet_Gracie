Rails.application.routes.draw do
  
  
	get 'pages/static_lp'
	get 'pages/secret_page'
	get 'pages/admin_interface'

	post 'pages/admin_interface', to: 'pages#admin_interface'

	get 'pages/home_page'
	root 'pages#landing_page'

	devise_for :admins, controllers: { registrations: 'admins/registrations' }
	
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	resources :charges
	
	devise_for :users, controllers: {
	omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations', sessions: 'users/sessions' 
	}
	
	scope '/admin' do
		resources :users
	end

	
	match "/404", to: "erreurs#page_introuvable", via: :all
  	match "/422", to: "erreurs#erreur_interne", via: :all
  	match "/500", to: "erreurs#erreur_interne", via: :all
  
end
