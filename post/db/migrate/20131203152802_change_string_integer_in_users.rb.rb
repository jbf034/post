class ChangeStringIntegerInUsers < ActiveRecord::Migration
  def up
	change_column :users,:bj,:integer
  end

  def down
    change_column :users,:bj,:string
  end
end
