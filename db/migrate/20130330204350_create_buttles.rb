class CreateButtles < ActiveRecord::Migration
  def change
    create_table :buttles do |t|

      t.timestamps
    end
  end
end
