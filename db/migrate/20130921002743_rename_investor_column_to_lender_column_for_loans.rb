class RenameInvestorColumnToLenderColumnForLoans < ActiveRecord::Migration
  def change
    rename_column :loans, :investor_id, :lender_id
  end
end
