class CreateWallets < ActiveRecord::Migration[5.1]
  def change
    create_table :wallets do |t|
      t.string :address, null: false
      t.string :description
      t.references :track, foreign_key: true, null: false

      t.timestamps
    end
  end
end
