class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.string :type
      t.string :name
      t.string :color
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end