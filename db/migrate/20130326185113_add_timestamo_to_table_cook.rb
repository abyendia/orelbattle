class AddTimestamoToTableCook < ActiveRecord::Migration
  def change
    add_timestamps :cooks
  end
end