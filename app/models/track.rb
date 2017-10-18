class Track < ApplicationRecord
  has_secure_token
  has_many :wallets, dependent: :destroy
  belongs_to :currency, optional: true
  accepts_nested_attributes_for :wallets, allow_destroy: true
  
  def total_chc
    wallets.sum(&:chc_earned)
  end
  
  def total_usd
    wallets.sum(&:usd_earned)
  end
  
  def currency_name
    currency&.name || 'usd'
  end
  
  def currency_unit
    currency&.unit || '$'
  end
end
