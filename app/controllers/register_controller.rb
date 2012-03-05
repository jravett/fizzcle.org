class RegisterController < ApplicationController

	def list
	
		unless session[:active_month]
			session[:active_month] = Date.today.month
		end
		
		unless session[:active_year]
			session[:active_year] = Date.today.year
		end
	
		if request.post?
			# switch to use a new month
			m = params[:date][:month]
			session[:active_month] = m
			session[:active_year]=2012
			logger.info 'switching to month # ' + m.to_s
		end
	
		@month=session[:active_month]
		@year=session[:active_year]
		
		logger.info 'using month # ' + @month.to_s
		logger.info 'using year  # ' + @year.to_s
		
		# create a listing of all the transactions
		@start_date = Date.new(@year, @month.to_i, 1)
		@end_date = @start_date.end_of_month
	
		
		@txs = Transaction.find(:all,
														:conditions => ["date >= ? and date <= ?", @start_date, @end_date],
														:order => "date DESC")
	end
	
	def delete
		#find the transaction based on the given id
		@tx = Transaction.find(params[:id])
		
		#delete it
		@tx.destroy
		
		#redirect back to the register list
		redirect_to :action=>:list
	end
	
	def edit
		#find the correct transaction to edit
		@tx = Transaction.find(params[:id])
		@tx_payee = @tx.payee
		#pass to the view for editing...
	end
	
	def update_transaction
		#update an existing transaction based on changes from the view
	  @tx = Transaction.find(params[:id])
		
		@tx.date = params[:transaction][:date]
		@tx.amount = params[:transaction][:amount]
		@tx.tag_list = params[:transaction][:tag_list]
		
		p = @tx.payee
		p.friendly_name = params[:tx_payee][:friendly_name]
		p.last_tag = @tx.tag_list.to_s
		p.save
		@tx.save
#		@tx.update_attributes(params[:transaction])
		
		redirect_to :action=>:list
	end
	
	def new
		#create a blank, dummy transaction for the view to work with
		@tx = Transaction.new
	end
	
	def save_new_transaction
		@tx = Transaction.new(params[:transaction])
		@tx.save
		redirect_to :action=>:list
	end
	
	def update_tag
		@tx = Transaction.find(params[:id])
		
		@tx.tag = params[:tag]
		
		logger.info 'the tag is -> ' + params[:tag]
		
		@tx.save
		
		redirect_to :action=>:list
	end
	
end
