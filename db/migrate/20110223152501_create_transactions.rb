class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
		t.column :date,	:date
		t.column :payee, :string
		t.column :amount, :decimal
		t.column :account, :string
		t.column :tag,	:string
      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
