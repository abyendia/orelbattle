class AddTableBattle < ActiveRecord::Migration
  def up
  	create_table :buttles do |t|
  	  t.integer :opponent_1, :opponent_2
  	  t.string :name
  	  t.text :description 		
  	  t.datetime :created_at, :updated_at
  	  t.integer :opp_voice_vk_1, :default => 0
  	  t.integer :opp_voice_vk_2, :default => 0
  	end	
  end

  def down
  	drop_table :buttles
  end
end
