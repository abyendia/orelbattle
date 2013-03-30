class AddImageToLots < ActiveRecord::Migration
  def change
    add_column :lots, :image_file_name, :string
    add_column :lots, :image_content_type, :string
    add_column :lots, :image_file_size, :integer
  end
end
