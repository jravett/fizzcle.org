class ApplicationController < ActionController::Base
  protect_from_forgery
	#session[:active_month] = Date.today.month	#start out with current month
	#session[:active_year] = 2011	#start out with current year
	
end
