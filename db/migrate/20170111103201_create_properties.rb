class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.text :description
      t.string :street
      t.string :city
      t.string :country
      t.integer :zimmer
      t.integer :size

      t.timestamps
    end
  end
end
