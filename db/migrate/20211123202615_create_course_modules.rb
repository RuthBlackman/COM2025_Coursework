class CreateCourseModules < ActiveRecord::Migration[5.2]
  def change
    create_table :course_modules do |t|
      t.string :Title, null: false
      t.string :ModuleCode, null: false
      t.text :ModuleOverview, null: false
      t.string :ModuleLeader, null: false
      t.integer :ModuleLeaderID, null: false
      t.integer :Credits, null: false
      t.integer :Year, null: false

      t.timestamps
    end
  end
end
