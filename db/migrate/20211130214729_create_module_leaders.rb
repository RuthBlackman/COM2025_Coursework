class CreateModuleLeaders < ActiveRecord::Migration[5.2]
  def change
    create_table :module_leaders do |t|
      t.string :firstName, null: false
      t.string :lastName, null: false
      t.string :department, null: false
      t.string :office, null: false
      t.string :officeHours, null:false

      t.timestamps
    end
  end
end
