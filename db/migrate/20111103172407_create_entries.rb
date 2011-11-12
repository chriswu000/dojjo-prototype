class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.integer :user_id
      t.datetime :entry_date, :default => Date.today

      t.timestamps
    end
    add_index :entries, :user_id
    add_index :entries, [:user_id, :entry_date]
  end

  def self.down
    drop_table :entries
  end
end
