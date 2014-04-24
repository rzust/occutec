class AddIsAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_admin, :boolean, :after => 'address'
    add_column :users, :is_superadmin, :boolean, :after => 'address'
  end
end
