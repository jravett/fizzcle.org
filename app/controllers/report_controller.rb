class ReportController < ApplicationController

	def summary_old

		if request.post?
			@month = params[:date][:month]
			logger.info 'using given month ' + @month.to_s
		else
			logger.info 'defaulting to current month...'
			@month=Date.today.month
		end
		
		@year=2013;
		
		@start_date = Date.new(@year, @month.to_i, 1)
		@end_date = @start_date.end_of_month
		
		# Transaction.find_tagged_with("crap", :conditions=>'account_id=10')
		
		@tag_amounts=Transaction.sum(:amount, :conditions=>{:date=> (@start_date)..(@end_date)}, :group=>:tag) #this works!
		@title = Date::MONTHNAMES[@month.to_i].to_s + " " + @year.to_s
	end
	
	def summary

		if request.post?
			@month = params[:date][:month]
			logger.info 'using given month ' + @month.to_s
		else
			logger.info 'defaulting to current month...'
			@month=Date.today.month
		end
		
		@year=2013;
		
		@start_date = Date.new(@year, @month.to_i, 1)
		@end_date = @start_date.end_of_month
		
		# Transaction.find_tagged_with("crap", :conditions=>'account_id=10')
		
		@txs = Transaction.where(:date=> (@start_date)..(@end_date))
		
		@tag_amounts = Hash.new
		
		@txs.each do |tx|
			tags = tx.tag_list
			tags.each do |tg|
				if @tag_amounts[tg]
					@tag_amounts[tg] += tx.amount
				else
					@tag_amounts[tg] = tx.amount
				end
			end
		end
		
		@title = Date::MONTHNAMES[@month.to_i].to_s + " " + @year.to_s
	end
	
	def tag
	
		if request.post?
			@month = params[:date][:month]
			@year=Date.today.year
				
			@start_date = Date.new(@year, @month.to_i, 1)
			@end_date = @start_date.end_of_month
	
			@tag_name = params[:tag_name]
			@txs = Transaction.find_tagged_with(@tag_name, :conditions=>{:date=>(@start_date)..(@end_date)})
			
			@sum=0
			@txs.each {|t| @sum += t.amount}
		else
			@month=Date.today.month
			@year=Date.today.year
			@start_date = Date.new(@year, @month.to_i, 1)
		end
		
	end

end
