class Search < ApplicationRecord
  belongs_to :user
  validates_presence_of :query, :ip_address
end
