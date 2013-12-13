class RenameBjToBjIdUsers < ActiveRecord::Migration
  def up
rename_column :users,:bj,:bj_id
  end

  def down
  rename_column :users,:bj_id,:bj
  end
end
