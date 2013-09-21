class RenameFundraisingStatusToAmountRaisedForProjects < ActiveRecord::Migration
  def change
    rename_column :projects, :fundraising_status, :amount_raised
  end
end
