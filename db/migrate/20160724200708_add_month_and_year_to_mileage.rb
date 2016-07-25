class AddMonthAndYearToMileage < ActiveRecord::Migration
  def change
    add_column :mileages, :month, :integer
    add_column :mileages, :year, :integer
  end
end
