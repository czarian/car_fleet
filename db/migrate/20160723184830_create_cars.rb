class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :reg_number

      t.timestamps null: false
    end
  end
end
