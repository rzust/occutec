class EventImage < ActiveRecord::Base
  belongs_to :event
  
  mount_uploader :image, ImageUploader

  

  def to_jq_upload
    {
      :name => read_attribute(:image),
      :type => nil, 
      :size => image.size,
      :url => image.url,
      :thumbnailUrl => image_url(:thumb),
      :delete_url => "event_images/#{id}",
      :delete_type => "DELETE" 
    }
  end
end
