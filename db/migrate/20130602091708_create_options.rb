class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
    	t.string :param, :null => false, :unique => true, :limit => 32
    	t.string :value, :default => nil, :limit => 32

      t.timestamps
    end
  end
end
