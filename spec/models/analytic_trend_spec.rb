require 'rails_helper'

RSpec.describe AnalyticTrend, type: :model do
  context 'Instance of a analytic_trend' do
    it 'Expect to be an instance of analytic_trend' do
      analytic_trend = AnalyticTrend.new
      expect(analytic_trend).to be_an_instance_of(AnalyticTrend)
    end
  end

  context 'with invalid params' do
    it 'Should not be a valid analytic_trend with no params' do
      analytic_trend = AnalyticTrend.new
      expect(analytic_trend).to_not be_valid
    end
  end

  context 'with Valid params' do
    it 'Should save a new analytic_trend wit valid params' do
      analytic_trend = AnalyticTrend.new
      analytic_trend.query = 'What is a good car'
      expect(analytic_trend).to be_valid
    end
  end
end
