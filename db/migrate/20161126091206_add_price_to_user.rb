class AddPriceToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :price, :decimal, precision: 10, scale: 2
  end
end
