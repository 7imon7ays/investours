class ReplaceTourStartDateAndEndDateWithSimpleDate < ActiveRecord::Migration
  def change
    add_column :tours, :date, :date
    remove_column :tours, :start_date
    remove_column :tours, :end_date
  end
end
