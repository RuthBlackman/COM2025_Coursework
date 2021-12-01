class CreateSelectedModules < ActiveRecord::Migration[5.2]
  def change
    create_table :selected_modules do |t|

      t.timestamps

      t.references :user , foreign_key: true, null: false
      t.references :course_module, foreign_key: true, null: false
    end

    #cannot have a selected module with the same user id and course module id
    add_index :selected_modules, [:user_id, :course_module_id], unique: true

  end
end
