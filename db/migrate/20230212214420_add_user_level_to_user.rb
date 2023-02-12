class AddUserLevelToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :user_level, :float, null: false, default: 0.0
  end
end
