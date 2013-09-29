class MakeInterestRatesZeroByDefault < ActiveRecord::Migration
  def change
    change_column_default :loans, :interest, 0
  end
end
