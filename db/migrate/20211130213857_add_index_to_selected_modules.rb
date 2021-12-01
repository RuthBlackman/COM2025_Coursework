class AddIndexToSelectedModules < ActiveRecord::Migration[5.2]
  def change
    add_index :selected_modules, :selectedModulesID, unique: true
  end
end
