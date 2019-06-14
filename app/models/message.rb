class Message < ApplicationRecord

	 after_create :send_mail_visitor

  def send_mail_visitor
    VisitorMailer.lesson_try(self).deliver_now
  end
end
