class CreateTourMeetings < ActiveRecord::Migration
  def change
    create_table :tour_meetings do |t|
      t.integer :entrepreneur_id, null: false
      t.integer :tour_id, null: false

      t.timestamps
    end
  end
end
