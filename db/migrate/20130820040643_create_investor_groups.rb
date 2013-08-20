class CreateInvestorGroups < ActiveRecord::Migration
  def change
    create_table :investor_groups do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
