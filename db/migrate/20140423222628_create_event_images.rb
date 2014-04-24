class CreateEventImages < ActiveRecord::Migration
  def change
    create_table :event_images do |t|
      t.integer :event_id
      t.string :image
      t.string :tags
      t.timestamps
    end
  end
end
