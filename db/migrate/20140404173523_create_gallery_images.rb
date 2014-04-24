class CreateGalleryImages < ActiveRecord::Migration
  def change
    create_table :gallery_images do |t|
      t.integer :gallery_id
      t.string :image
      t.string :tags
      t.timestamps
    end
  end
end
