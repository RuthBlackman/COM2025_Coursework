
class AddYearToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :year, :integer, default: 1
  end
end
