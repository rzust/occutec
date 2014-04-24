class Gallery < ActiveRecord::Base
  belongs_to :product
  belongs_to :page
  has_many   :gallery_images
  accepts_nested_attributes_for :gallery_images, :allow_destroy => true
end
