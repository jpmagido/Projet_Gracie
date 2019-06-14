class VisitorMailer < ApplicationMailer

	default from: 'no-reply@graciebarraparis75.com'

	def lesson_try(message)

		@url  = 'http://graciebarra75.com' 
	
		@visitor_name = message.name
		@visitor_email = message.email
		@visitor_phone = message.phone
		@visitor_text = message.text
		@admin_mail = Admin.first.email
		
		mail(to: @admin_mail, subject: 'Réservation cours essai !') 

	end
end
