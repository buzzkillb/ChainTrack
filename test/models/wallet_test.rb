require 'minitest/mock'

class WalletTest < ActiveSupport::TestCase
  test 'return 0 when less than 5000' do
    wallet = Wallet.new(address: 'address')
    wallet.stub :total_dnr, 1 do
      assert_equal 0, wallet.dnr_earned
    end
  end
  
  test 'return earned amount' do
    wallet = Wallet.new(address: 'address')
    wallet.stub :total_dnr, 5035 do
      assert_equal 35, wallet.dnr_earned
    end
  end
end
