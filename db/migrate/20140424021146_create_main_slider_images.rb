class CreateMainSliderImages < ActiveRecord::Migration
  def change
    create_table :main_slider_images do |t|
      t.string :image
      t.string :tags
      t.timestamps
    end
  end
end
