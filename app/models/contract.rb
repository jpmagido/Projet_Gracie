class Contract < ApplicationRecord

	belongs_to :user
	belongs_to :formula

	#after_create :contract_email


	def contract_email
    	UserMailer.contract_email(self.user_id).deliver_now
  	end

end
