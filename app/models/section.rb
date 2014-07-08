class Section < ActiveRecord::Base
  belongs_to :page
  belongs_to :product
  has_one    :category
  mount_uploader :image, ImageUploader
end
