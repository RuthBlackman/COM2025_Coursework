class AddIndexToModuleLeaders < ActiveRecord::Migration[5.2]
  def change
    add_index :module_leaders, :moduleLeaderID, unique: true
  end
end
