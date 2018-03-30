class CreateUsertaxes < ActiveRecord::Migration[5.0]
  def change
    create_table :usertaxes do |t|
      t.references :user, foreign_key: true
      t.integer :ref_id, default: 0
      t.string :txn_type , default: ''
      t.string :transfer_id, default: ''
      t.references :wallet, foreign_key: true
      t.string :address, default: ''
      t.string :txn_id, default: ''
      t.string :currency, default: ''
      t.float :amount, defualt: 0.0
      t.boolean :state, default: false
      t.boolean :confirmatons, default: true
      t.text :response, default: ''

      t.timestamps
    end
  end
end
