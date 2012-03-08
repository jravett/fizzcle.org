class User < ActiveRecord::Base

	def self.authenticate(login, pass)
	  u=find(:first, :conditions=>["login = ?", login])
	  return nil if u.nil?
	  if pass==u.password
	  	return u
	  else
	  	return nil
	  end
	end  

end
