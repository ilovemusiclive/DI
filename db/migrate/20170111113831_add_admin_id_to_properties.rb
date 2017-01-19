class AddAdminIdToProperties < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :admin_id, :integer
  end
end
