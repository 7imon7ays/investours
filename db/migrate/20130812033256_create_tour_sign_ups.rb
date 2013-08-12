class CreateTourSignUps < ActiveRecord::Migration
  def change
    create_table :tour_sign_ups do |t|
      t.integer :user_id, null: false
      t.integer :tour_id, null: false

      t.timestamps
    end
  end
end
