class CreateMileages < ActiveRecord::Migration
  def change
    create_table :mileages do |t|
      t.float :value
      t.references :car, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
