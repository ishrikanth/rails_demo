class AddDummyToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :dummy, :string
  end
end
