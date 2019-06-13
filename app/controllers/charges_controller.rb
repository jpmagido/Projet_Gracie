class ChargesController < ApplicationController
	
		#before_action :authenticate_user! or :authenticate_admin!
	

	attr_accessor :sub
	def new
		@amount = flash[:price]
		p session[:admin_uid]
		p params
	end

	def create
	  # Amount in cents
	  @amount = params[:price].to_i 
	  
	  

		 
		  customer = Stripe::Customer.create({
		    email: params[:stripeEmail],
		    source: params[:stripeToken],
		  })

		  charge = Stripe::Charge.create({
		    customer: customer.id,
		    amount: @amount,
		    description: 'Rails Stripe customer',
		    currency: 'eur',
		  })
		  
		  #manque params Formula.find(params[:id])
		  begin
		  	Contract.create(user_id: current_user.id ,formula_id: Formula.where(price: @amount).ids[0])
		  rescue
		  	Contract.create(user_id: session[:admin_uid] ,formula_id: Formula.where(price: @amount).ids[0])
		  end

		

		rescue Stripe::CardError => e
		  flash[:error] = e.message
		  flash[:price] = @amount
		  # flash[:user] = @user_to_edit
		  redirect_to new_charge_path
		end
	
		
end
