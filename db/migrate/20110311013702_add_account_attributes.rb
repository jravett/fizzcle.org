class AddAccountAttributes < ActiveRecord::Migration
  def self.up
		add_column :accounts, :ofx_ORG, :string
		add_column :accounts, :ofx_FI, :string
		add_column :accounts, :ofx_ACCTID, :string
		add_column :accounts, :balance, :decimal, :precision=>8, :scale=>2
		remove_column :accounts, :fi_id
  end

  def self.down
		remove_column :accounts, :ofx_ORG
		remove_column :accounts, :ofx_FI
		remove_column :accounts, :ofx_ACCTID
		remove_column :accounts, :balance
		add_column :accounts, :fi_id, :integer
		
  end
end
