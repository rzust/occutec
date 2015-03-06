# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  #include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog
  version :logo, :if => :is_product?
  version :slider, :if => :is_gallery_image?
  version :section, :if => :is_section?
  version :event, :if => :is_event?
  version :main_slider, :if => :is_main_slider?
  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :small do
    process resize_to_fit: [150, 150]
  end

  version :thumb do
    process resize_to_fill: [316, 200]
  end

  version :section do
    process resize_to_fit: [400, 400]
  end

  version :logo do
    process resize_to_fit: [660, 340]
  end

  version :slider do
    process resize_to_fill: [940, 340]
  end

  version :main_slider do
    process resize_to_fill: [1110, 322]
    
  end

  version :event do
    process resize_to_fit: [800, 800]
  end

  def is_product? picture
    model.class.name == "Product"
  end

  def is_gallery_image? picture
    model.class.name == "GalleryImage"
  end

  def is_section? picture
    model.class.name == "Section"
  end

  def is_event? picture
    model.class.name == "EventImage"
  end

  def is_main_slider? picture
    model.class.name == "MainSliderImage"
  end



  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end



  # process :resize_to_fit => [100, 100]
  # Create different versions of your uploaded files:

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end


end
