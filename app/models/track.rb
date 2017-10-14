class Track < ApplicationRecord
  has_secure_token
  has_many :wallets
end
