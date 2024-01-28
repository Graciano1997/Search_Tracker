class Search < ApplicationRecord
  validates_presence_of :query, :ip_address
end
