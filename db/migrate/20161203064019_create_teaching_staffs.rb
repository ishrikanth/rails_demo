class CreateTeachingStaffs < ActiveRecord::Migration[5.0]
  def change
    create_table :teaching_staffs do |t|
      t.integer :ta_staff_id
      t.string :ta_staff_type
      t.boolean :is_active

      t.timestamps
    end
  end
end
