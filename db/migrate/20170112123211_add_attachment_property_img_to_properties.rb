class AddAttachmentPropertyImgToProperties < ActiveRecord::Migration
  def self.up
    change_table :properties do |t|
      t.attachment :property_img
    end
  end

  def self.down
    remove_attachment :properties, :property_img
  end
end
