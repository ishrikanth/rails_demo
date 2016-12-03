class AddRoleNoToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :role_no, :integer
    add_index :users, :role_no
  end
end
