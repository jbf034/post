class ChangeStringIntegerInBjs < ActiveRecord::Migration
  def up
	change_column :bjs,:bj_num,:integer
	rename_column :bjs,:class_name,:bj_name
  end

  def down
   change_column :bjs,:bj_num,:string
   rename_column :bjs,:bj_name,:class_name
  end
end
