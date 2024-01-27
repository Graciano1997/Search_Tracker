class AnalyticTrend < ApplicationRecord
    validates_presence_of :query
    # validates :search_total, numericality: { greater_than_or_equal: 0 }
end
