class RemoveTagColumn < ActiveRecord::Migration
  def self.up
		remove_column :transactions, :tag
  end

  def self.down
		add_column :transactions, :tag, :string
  end
end
