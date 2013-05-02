class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :name, :default => ''
      t.string :email, :default => ''
      t.string :theme, :default => ''
      t.text :message, :default => '' 

      t.timestamps
    end
  end
end
