class CreateBankDetails < ActiveRecord::Migration
  def change
    create_table :bank_details do |t|
      t.integer :user_id
      t.string :account_no
      t.string :bank_name

      t.timestamps
    end
  end
end
