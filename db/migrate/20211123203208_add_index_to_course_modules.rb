class AddIndexToCourseModules < ActiveRecord::Migration[5.2]
  def change
    add_index :course_modules, :title, unique: true
  end
end
