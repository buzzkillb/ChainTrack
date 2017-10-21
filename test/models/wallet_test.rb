require 'minitest/mock'

class WalletTest < ActiveSupport::TestCase
  test 'return 0 when less than 1000' do
    wallet = Wallet.new(address: 'address')
    wallet.stub :total_chc, 1 do
      assert_equal 0, wallet.chc_earned
    end
  end
  
  test 'return earned amount' do
    wallet = Wallet.new(address: 'address')
    wallet.stub :total_chc, 1035 do
      assert_equal 35, wallet.chc_earned
    end
  end
end
