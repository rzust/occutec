class CreateAccessRequests < ActiveRecord::Migration
  def change
    create_table :access_requests do |t|
      t.string :company
      t.string :legal_code
      t.string :contact
      t.string :phone_1
      t.string :phone_2
      t.text :comment
      t.string :state

      t.timestamps
    end
  end
end
