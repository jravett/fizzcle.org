class UserController < ApplicationController
  def login
    if request.post?
    	if session[:user] = User.authenticate(params[:login], params[:password])
        	flash[:notice]  = "Login successful!"
					redirect_to :controller => 'main', :action => 'index'
			else
       		flash[:notice] = "Login unsuccessful"
      end
    end
  end

  def logout
    session[:user] = nil
    flash[:notice] = 'Logged out'
    redirect_to :action => 'login'
  end
end
