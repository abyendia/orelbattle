class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
    	t.string  :ip
    	t.integer :kind_of_vote, :default => 0
    	t.integer :buttle_id
    	t.integer :lot_id

      t.timestamps
    end
  end
end
