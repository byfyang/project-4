class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.string :exercise
      t.integer :calories
      t.integer :time

      t.timestamps null: false
    end
  end
end
