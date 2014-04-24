class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.boolean :main, default: false
      t.string  :name
      t.string  :position
      t.string  :description
      t.string  :address1
      t.string  :address2
      t.string  :email1
      t.string  :email2
      t.string  :phone1
      t.string  :phone2
      t.string  :phone3
      t.string  :state
      t.string  :week_available
      t.string  :saturday_available
      t.string  :sunday_available
      t.timestamps
    end
  end
end
