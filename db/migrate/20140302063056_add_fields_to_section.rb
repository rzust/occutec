class AddFieldsToSection < ActiveRecord::Migration
  def change
    add_column :sections, :has_image, :boolean, :after => "image"
    add_column :sections, :has_title, :boolean, :after => "image"
    add_column :sections, :image_size, :string, :after => "image"
  end
end
