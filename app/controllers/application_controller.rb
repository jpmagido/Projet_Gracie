class ApplicationController < ActionController::Base

	before_action :configure_devise_parameters, if: :devise_controller?

	def configure_devise_parameters
		attributes = [:first_name, :last_name, :age, :belt, :phone, :profession, :nationality, :weight, :password, :password_confirmation, :email]
	  devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(attributes)}
	  devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(attributes)}
	end

	  def render_not_found
	    render :file => "#{RAILS_ROOT}/public/404.html",  :status => 404
	  end
	
end
