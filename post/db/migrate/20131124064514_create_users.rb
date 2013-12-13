class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :bj
      t.text :content
      t.string :name

      t.timestamps
    end
  end
end
