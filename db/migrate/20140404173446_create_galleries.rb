class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name
      t.string :description
      t.integer :page_id
      t.integer :product_id
      t.timestamps
    end
  end
end
