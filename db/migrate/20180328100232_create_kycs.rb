class CreateKycs < ActiveRecord::Migration[5.0]
  def change
    create_table :kycs do |t|
      t.string :aadhar_number, default: ''
      t.string :aadhar_front, default: ''
      t.string :aadhar_back, default: ''
      t.string :pan_card_number, default: ''
      t.string :pan_card_image, default: ''
      t.string :bank_name, default: ''
      t.string :account_number, default: ''
      t.string :account_holder_name, default: ''
      t.string :mobile_number, default: ''
      t.string :branch_name, default: ''
      t.string :account_type, default: ''
      t.string :ifsc_code, default: ''
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
