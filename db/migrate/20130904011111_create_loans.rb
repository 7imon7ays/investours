class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.integer :entrepreneur_id, null: false
      t.integer :investor_id, null: false
      t.decimal :progress, null: false, default: 0, limit: 100, precision: 5, scale: 2
      t.timestamps
    end
  end
end
