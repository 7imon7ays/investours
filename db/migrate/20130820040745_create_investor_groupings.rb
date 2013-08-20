class CreateInvestorGroupings < ActiveRecord::Migration
  def change
    create_table :investor_groupings do |t|
      t.integer :investor_id, null: false
      t.integer :group_id, null: false

      t.timestamps
    end
  end
end
