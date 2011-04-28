class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
			t.column :name, :string
			t.column :fi_id, :integer
			t.column :last_import_date, :date
      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
