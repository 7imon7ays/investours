class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :loan_id, null: false
      t.integer :entrepreneur_id, null: false
      t.decimal :amount, precision: 8, scale: 2, null: false

      t.timestamps
    end
  end
end
