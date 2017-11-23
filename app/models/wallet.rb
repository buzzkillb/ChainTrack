class Wallet < ApplicationRecord
  belongs_to :track
  validates :address, presence: true, address: true
  validates :description, length: { in: 0..64 }
  default_scope { order('created_at ASC') }
  
  def chc_earned
    [0, total_chc - 1000].max
  end
  
  def secondary_earned
    chc_earned * secondary_info[:price]
  end
  
  def secondary_info
    key = "https://api.coinmarketcap.com/v1/ticker/chaincoin/?convert=#{track.currency_name.upcase}"
    Rails.cache.fetch(key, expires_in: 1.hour) do
      json = JSON.parse(Net::HTTP.get(URI(key)))
      { 
        price: json[0]["price_#{track.currency_name.downcase}"].to_f,
        change: json[0]['percent_change_24h'].to_f 
      }
    end
  end
  
  def total_chc
    key = "http://104.238.153.140:3001/ext/getbalance/#{address}"
    Rails.cache.fetch(key, expires_in: 1.hour) do
      total = Net::HTTP.get(URI(key)).to_f
      record_total(total)
      total
    end
  end
  
  private
  
  def record_total total
    if last_total != total
      update_attributes(last_total: total, last_changed: Time.current)
    end
  end
end
