class AddTableLot < ActiveRecord::Migration
  def up
  	create_table :lots do |t|
  		t.string :name
  		t.text :description
  		t.string :url_message
  		t.datetime :created_at, :updated_at
  	end	
  end

  def down
  	drop_table :lots
  end
end
