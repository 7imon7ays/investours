class CreateEntrepreneurs < ActiveRecord::Migration
  def change
    create_table :entrepreneurs do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :location

      t.timestamps
    end
  end
end
