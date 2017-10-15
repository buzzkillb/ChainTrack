require 'net/http'

class AddressValidator < ActiveModel::EachValidator
  def validate_each record, attribute, value
    uri = URI("http://104.238.153.140:3001/ext/getbalance/#{value}")
    response = Net::HTTP.get(uri)
    if response.to_i < 1000
      record.errors[attribute] << 'does not seem to belong to a masternode'
    end
  end
end
