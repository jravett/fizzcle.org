class TransactionsController < ApplicationController
#  respond_to :html, :json
  
def index
		unless session[:active_month]
			session[:active_month] = Date.today.month
		end
		
		unless session[:active_year]
			session[:active_year] = Date.today.year
		end
	
		if params[:date]
			# switch to use a new month
			m = params[:date][:month]
			y = params[:date][:year]
			session[:active_month] = m
			session[:active_year]=y
			logger.info 'switching to month # ' + m.to_s
		end
	
		@month=session[:active_month]
		@year=session[:active_year]
		
		## just for now...
		## @year=2012
		
		logger.info 'using month # ' + @month.to_s
		logger.info 'using year  # ' + @year.to_s
		
		# create a listing of all the transactions
		@start_date = Date.new(@year.to_i, @month.to_i, 1)
		@end_date = @start_date.end_of_month
	
		
		@txs = Transaction.find(:all,
														:conditions => ["date >= ? and date <= ?", @start_date, @end_date],
														:order => "date DESC")
														
end

def show
end

def create
    respond_to do |format|
      format.html { redirect_to transactions_url }
      format.json { head :no_content }
    end
end


	
	def destroy
		#find the transaction based on the given id
		@tx = Transaction.find(params[:id])
		
		#delete it
		@tx.destroy

    respond_to do |format|
      format.html { redirect_to transactions_url }
      format.json { head :no_content }
    end
		
	end
	
	def edit
		#find the correct transaction to edit
		@tx = Transaction.find(params[:id])
#		@tx_payee = @tx.payee
		#pass to the view for editing...
	end
	
#	def update
#    @tx = Transaction.find(params[:id])
#
#    respond_to do |format|
#      format.html { redirect_to transactions_url }
#      format.json { head :no_content }
#      end
#	end
	
	# PUT /transactions/1
  # PUT /transactions/1.json
	def update

	  @tx = Transaction.find(params[:id])
	  logger.info 'ajax update? ' + @tx.date.to_s
		respond_to do |format|	
      @tx.update_attributes(params[:transaction])
  
  #		@tx.date = params[:transaction][:date]
	#		@tx.amount = params[:transaction][:amount]
	#		@tx.tag_list = params[:transaction][:tag_list]
	#		@tx.save

 				format.html do
 					p = @tx.payee
#					p.friendly_name = params[:tx_payee][:friendly_name]
					p.friendly_name = params[:payee][:friendly_name]
					p.last_tag = @tx.tag_list.to_s
					p.save
					redirect_to transactions_url 
 				end
     	 format.json { head :no_content }
      end

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
