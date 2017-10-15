class Track < ApplicationRecord
  has_secure_token
  has_many :wallets
  accepts_nested_attributes_for :wallets
end
