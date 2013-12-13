class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :manage
      t.string :password
      t.string :manage_type

      t.timestamps
    end
  end
end
