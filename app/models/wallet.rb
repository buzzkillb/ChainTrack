class Wallet < ApplicationRecord
  belongs_to :track
  validates :address, presence: true, address: true
  default_scope { order('created_at ASC') }
  
  def chc_earned
    total_chc - 1000
  end
  
  def usd_earned
    chc_earned * chc_price
  end
  
  def chc_price
    key = "https://api.coinmarketcap.com/v1/ticker/chaincoin/?convert=#{track.currency_name.upcase}"
    Rails.cache.fetch(key, expires_in: 1.hour) do
      json = JSON.parse(Net::HTTP.get(URI(key)))
      json[0]["price_#{track.currency_name.downcase}"].to_f
    end
  end
  
  def total_chc
    key = "http://104.238.153.140:3001/ext/getbalance/#{address}"
    Rails.cache.fetch(key, expires_in: 1.hour) do
      Net::HTTP.get(URI(key)).to_f
    end
  end
end
