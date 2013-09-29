class MakeInterestRatesZeroByDefault < ActiveRecord::Migration
  def change_column :loans, :interest, default: 0
  end
end
