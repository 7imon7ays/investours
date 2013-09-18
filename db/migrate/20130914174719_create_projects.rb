class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :entrepreneur_id, null: false
      t.string :title, null: false
      t.text :description
      t.decimal :fundraising_goal, null: false
      t.decimal :fundraising_status, null: false, default: 0

      t.timestamps
    end
  end
end
