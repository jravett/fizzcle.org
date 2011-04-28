class Payee < ActiveRecord::Base
	has_many :transactions
end
