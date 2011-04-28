class AddPayeeId < ActiveRecord::Migration
  def self.up
		add_column :transactions, :payee_id, :integer
  end

  def self.down
		remove_column :transactions, :payee_id
  end
end
