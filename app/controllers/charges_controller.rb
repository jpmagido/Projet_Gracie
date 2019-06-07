class ChargesController < ApplicationController
	attr_accessor :sub
	def new
		@amount = flash[:price]
		
	end

	def create
	  # Amount in cents
	  @amount = params[:price] 
	  
	  Contract.create(user_id: current_user,formula_id: Formula.first)

		 begin
		  customer = Stripe::Customer.create({
		    email: current_user.email,
		    source: params[:stripeToken],
		  })

		  charge = Stripe::Charge.create({
		    customer: customer.id,
		    amount: @amount,
		    description: 'Rails Stripe customer',
		    currency: 'usd',
		  })

		rescue Stripe::CardError => e
		  flash[:error] = e.message
		  flash[:price] = @amount
		  redirect_to new_charge_path
		end
	end
		
end
