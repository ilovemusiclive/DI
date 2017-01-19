class AddCategoryIdToProperties < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :category_id, :integer
  end
end
