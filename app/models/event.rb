class Event < ActiveRecord::Base
  has_many :event_images
  accepts_nested_attributes_for :event_images, :allow_destroy => true
  self.per_page = 8
end
