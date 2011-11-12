class AddIsDraftToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :is_draft, :boolean, :default => false
  end

  def self.down
    remove_column :items, :is_draft
  end
end
