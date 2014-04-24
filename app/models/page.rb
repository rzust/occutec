class Page < ActiveRecord::Base
  has_many :sections
  has_one  :gallery
  has_many :gallery_images, :through => :gallery
end
