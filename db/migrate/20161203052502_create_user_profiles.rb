class CreateUserProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_profiles do |t|
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :avatar

      t.timestamps
    end
  end
end
