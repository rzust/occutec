class Section < ActiveRecord::Base
  belongs_to :page
  belongs_to :product
  mount_uploader :image, ImageUploader
end
