class CreateCurrencyAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :currency_addresses do |t|
      t.string :address_id, default: ''
      t.string :address, default: ''
      t.text :response, default: ''
      t.boolean :status, default: false
      t.integer :crypto_id
      t.string :cryto_type

      t.timestamps
    end
  end
end
