class CreateSelectedModules < ActiveRecord::Migration[5.2]
  def change
    create_table :selected_modules do |t|
      t.integer :StudentID, null: false
      t.integer :CourseModuleID, null: false

      t.timestamps
    end
  end
end
