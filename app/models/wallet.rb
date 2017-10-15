class Wallet < ApplicationRecord
  belongs_to :track
  validates :address, presence: true, address: true
end
