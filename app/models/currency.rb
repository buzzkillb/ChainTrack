class Currency < ApplicationRecord
  default_scope { order('name ASC') }
end
