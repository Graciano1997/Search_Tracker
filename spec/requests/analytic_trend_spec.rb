require 'rails_helper'

RSpec.describe 'Analytics', type: :request do
  describe 'GET /Analytic' do
    it 'GET /Searches path' do
      get analytic_trends_path
      expect(response.content_type).to eq 'text/html; charset=utf-8'
    end
  end
end
