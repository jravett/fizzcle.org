class RemoveColumnAccountName < ActiveRecord::Migration
  def self.up
		remove_column :transactions, :account
  end

  def self.down
		add_column :transactions, :account, :string
  end
end
