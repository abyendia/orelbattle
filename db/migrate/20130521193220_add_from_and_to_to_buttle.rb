class AddFromAndToToButtle < ActiveRecord::Migration
  def change
  	add_column :buttles, :from, :datetime, :default => Time.at(Time.now.to_i - 6.month)
  	add_column :buttles, :to, :datetime, :default => Time.at(Time.now.to_i + 6.month)  	
  end
end
