class PagesController < ApplicationController
	before_action :authenticate_admin!, only: [:admin_interface]
  before_action :authenticate_user!, only: [:secret_page]
   
  def static_lp
    session[:admin_uid] = params[:format]

  end

  def landing_page

  end

  def secret_page
    
  end

  def home_page
    
  end
  def admin_interface
      @first_name = " "
      @last_name = " "
      if params[:name] == nil or params[:name] == ""
        @first_name = " "
      @last_name = " "
      else
        @first_name = params[:name].split.first.downcase
        if params[:name].split.first != params[:name].split.last
          @last_name = params[:name].split.last.downcase
        end
      end
  		@users = User.all

  		@users_number = User.all.count
  		@users_no_paid = User.where("subscription > '0'").count
 		
  end
end
