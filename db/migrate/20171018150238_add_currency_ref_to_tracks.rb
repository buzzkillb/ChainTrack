class AddCurrencyRefToTracks < ActiveRecord::Migration[5.1]
  def change
    add_reference :tracks, :currency, foreign_key: true
  end
end
