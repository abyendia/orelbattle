class AddTableCook < ActiveRecord::Migration
  def up
  	create_table :cooks do |t|
  		t.string :cook_key
  	end	
  end

  def down
  	drop_table :cooks
  end
end
