class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.integer :project_id, null: false
      t.integer :author_id, null: false
      t.string :title, null: false
      t.text :body, null: false
      
      t.timestamps
    end
  end
end
