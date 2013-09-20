class AddMetricsToLoans < ActiveRecord::Migration
  def change
    add_column :loans, :principal, :decimal, precision: 8, scale: 2, null: false
    add_column :loans, :interest, :decimal, precision: 8, scale: 2, null: false
  end
end
