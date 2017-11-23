class AddLastTotalAndLastChangedToWallets < ActiveRecord::Migration[5.1]
  def change
    add_column :wallets, :last_total, :decimal
    add_column :wallets, :last_changed, :datetime
  end
end
