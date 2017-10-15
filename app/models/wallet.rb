class Wallet < ApplicationRecord
  belongs_to :track
  validates :address, presence: true, address: true
  
  def chc_earned
    total_chc - 1000
  end
  
  def usd_earned
    chc_earned * chc_price
  end
  
  private
  
  def chc_price
    @chc_price ||= begin
      uri = URI("https://www.cryptopia.co.nz/api/GetMarket/CHC_USDT") 
      json = JSON.parse(Net::HTTP.get(uri))
      json['Data']['AskPrice']
    end
  end
  
  def total_chc
    @total_chc ||= begin
      uri = URI("http://104.238.153.140:3001/ext/getbalance/#{address}") 
      Net::HTTP.get(uri).to_i
    end
  end
end
