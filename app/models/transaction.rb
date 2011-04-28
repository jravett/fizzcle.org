class Transaction < ActiveRecord::Base
	acts_as_taggable
	belongs_to :account
	belongs_to :payee
end
