class RemoveAmountRaisedFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :amount_raised
  end
end
