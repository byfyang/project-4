class CreatePwds < ActiveRecord::Migration
  def change
    create_table :pwds do |t|

      t.timestamps null: false
    end
  end
end
