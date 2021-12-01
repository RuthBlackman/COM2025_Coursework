class CreateSelectedModules < ActiveRecord::Migration[5.2]
  def change
    create_table :selected_modules do |t|

      t.timestamps

      t.references :user , foreign_key: true, null: false
      t.references :course_module, foreign_key: true, null: false
    end

  end
end
