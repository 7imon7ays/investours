class RemoveProgressFromLoans < ActiveRecord::Migration
  def change
    remove_column :loans, :progress
  end
end
