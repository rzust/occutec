class Product < ActiveRecord::Base
  belongs_to :category
  has_one :gallery
  has_many :gallery_images, :through => :gallery
  has_many :sections
  accepts_nested_attributes_for :gallery_images, :allow_destroy => true

  mount_uploader :logo, ImageUploader

  self.per_page = 10

  # state_machine :state do
      
  #   state :active, :inactive
    
  #   event :activate do
  #     transition :inactive => :active
  #   end    
  #   event :inactivate do
  #     transition :active => :inactive
  #   end

  # end
end
