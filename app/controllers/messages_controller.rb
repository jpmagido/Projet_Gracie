class MessagesController < ApplicationController


	def create
		Message.create(messages_params) 
		redirect_to root_path
	end

	def messages_params
      params.permit(:name,:text, :phone, :email)
    end
end
