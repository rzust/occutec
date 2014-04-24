class MainSliderImage < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  def to_jq_upload
    {
      :name => read_attribute(:image),
      :type => nil, 
      :size => image.size,
      :url => image.url,
      :thumbnailUrl => image_url(:small),
      :delete_url => "#{id}",
      :delete_type => "DELETE" 
    }
  end
end
