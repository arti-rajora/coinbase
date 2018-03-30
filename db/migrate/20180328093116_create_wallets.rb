class CreateWallets < ActiveRecord::Migration[5.0]
  def change
    create_table :wallets do |t|
      t.string :address, default: ''
      t.string :coin, default: ''
      t.string :coin_type, default: ''
      t.string :qr_code_url, default: ''
      t.float :balance, default: 0.0
      t.integer :unit, default: 0
      t.float :locked_balance, default: 0.0 
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
