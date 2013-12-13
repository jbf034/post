class CreateBjs < ActiveRecord::Migration
  def change
    create_table :bjs do |t|
      t.integer :bj_id
      t.string :bj_name

      t.timestamps
    end
  end
end
