class Track < ApplicationRecord
  has_secure_token
  has_many :wallets, dependent: :destroy
  belongs_to :currency, optional: true
  accepts_nested_attributes_for :wallets, allow_destroy: true
  
  def dnr_price
    wallets.first.secondary_info[:price]
  end
  
  def dnr_change
    wallets.first.secondary_info[:change]
  end
  
  def total_dnr
    wallets.sum(&:dnr_earned)
  end
  
  def total_secondary
    wallets.sum(&:secondary_earned)
  end
  
  def currency_name
    currency&.name || 'usd'
  end
  
  def currency_unit
    currency&.unit || '$'
  end
  
  def currency_precision
    currency&.precision || 2
  end
end
