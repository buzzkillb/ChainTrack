class AddressValidator < ActiveModel::EachValidator
  def validate_each record, attribute, value
    if record.total_chc < 1000
      record.errors[attribute] << 'does not seem to belong to a masternode'
    end
  end
end
