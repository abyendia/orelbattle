class AddPublishedToButtles < ActiveRecord::Migration
  def change
  	add_column :buttles, :published, :boolean, :default => false
  end
end
