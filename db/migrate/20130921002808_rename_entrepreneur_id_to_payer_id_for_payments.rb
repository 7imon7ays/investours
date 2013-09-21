class RenameEntrepreneurIdToPayerIdForPayments < ActiveRecord::Migration
  def change
  rename_column :payments, :entrepreneur_id, :payer_id
  end
end
