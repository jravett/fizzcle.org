class AddGuid < ActiveRecord::Migration
  def self.up
		add_column :transactions, :guid, :string
  end

  def self.down
		remove_column :transactions, :guid
  end
end
