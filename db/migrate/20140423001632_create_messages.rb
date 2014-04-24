class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :name
      t.string :email
      t.text :message 
      t.string :state
      t.timestamps
    end
  end
end
