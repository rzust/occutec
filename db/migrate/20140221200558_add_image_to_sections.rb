class AddImageToSections < ActiveRecord::Migration
  def change
    add_column :sections, :image, :string, :after => "body"
  end
end
