class AddFieldsToSection < ActiveRecord::Migration
  def change
    add_column :sections, :has_image, :boolean, default: false, :after => "image"
    add_column :sections, :has_title, :boolean, default: false, :after => "image"
    add_column :sections, :image_size, :string, :after => "image"
  end
end
