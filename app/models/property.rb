class Property < ApplicationRecord
  belongs_to :admin
  belongs_to :category

  Paperclip::Attachment.default_options[:url] = ':s3_amazonaws.com'
  Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
  Paperclip::Attachment.default_options[:s3_host_name] = 'dovas-us-east-1'
  Paperclip::Attachment.default_options[:s3_protocol] = 'https'


  has_attached_file :property_img, styles: { property_index: "250x350>", property_show: "350x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :property_img, content_type: /\Aimage\/.*\z/
end
