class Property < ApplicationRecord
  belongs_to :admin
  belongs_to :category


  has_attached_file :property_img, styles: { property_index: "250x350>", property_show: "350x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :property_img, content_type: /\Aimage\/.*\z/
end
