class CreateDrivers < ActiveRecord::Migration[5.2]
  def change
    create_table :drivers do |t|
      t.string :full_name
      t.string :drive_count

      t.timestamps
    end
  end
end
