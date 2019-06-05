class PagesController < ApplicationController
  def static_lp
  end

  def landing_page
  end

  def admin_interface
  		@users = User.all
  		
  end
end
