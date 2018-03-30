class CreateBitgoLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :bitgo_logs do |t|
      t.text :response, default: ''
      t.text :request, default: ''
      t.string :url, default: ''
      t.string :event, default: ''
      t.inet     :ip_address
      t.string :method, default: ''

      t.timestamps
    end
  end
end
