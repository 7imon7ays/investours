class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :location
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
