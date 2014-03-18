class Section < ActiveRecord::Base
  belongs_to :page

  mount_uploader :image, ImageUploader
end
