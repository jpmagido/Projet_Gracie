class ChargesController < ApplicationController
	attr_accessor :sub
	def new
		@amount = flash[:price]
		
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
		    currency: 'usd',
		  })

		  Contract.create(user_id: current_user.id ,formula_id: Formula.first.id)

		rescue Stripe::CardError => e
		  flash[:error] = e.message
		  flash[:price] = @amount
		  redirect_to new_charge_path
		
	end
		
end
