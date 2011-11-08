class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.integer :entry_id
      t.string :content

      t.timestamps
    end
    add_index :items, :entry_id
  end

  def self.down
    drop_table :items
  end
end
