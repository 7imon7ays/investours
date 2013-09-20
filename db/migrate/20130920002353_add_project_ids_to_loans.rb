class AddProjectIdsToLoans < ActiveRecord::Migration
  def change
    add_column :loans, :project_id, :integer, null: false
  end
end
