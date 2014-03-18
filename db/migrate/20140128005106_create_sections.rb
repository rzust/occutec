class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.string :title
      t.text :body
      t.integer :page_id
      t.timestamps
    end
  end
end
