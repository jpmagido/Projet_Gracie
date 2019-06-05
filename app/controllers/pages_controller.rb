class PagesController < ApplicationController
  def static_lp
  end

  def landing_page
  end

  def admin_interface
  		@users = User.all
  		@users_number = User.all.count
  		@users_no_paid = User.where("subscription > '0'").count
  		
  end
end
