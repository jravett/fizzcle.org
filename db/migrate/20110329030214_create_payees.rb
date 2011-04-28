class CreatePayees < ActiveRecord::Migration
  def self.up
    create_table :payees do |t|
			t.column :name, :string
			t.column :friendly_name,	:string
			t.column :last_tag, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :payees
  end
end
