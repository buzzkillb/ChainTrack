class AddPrecisionToCurrency < ActiveRecord::Migration[5.1]
  def change
    add_column :currencies, :precision, :integer, default: 2, null: false
  end
end
