require 'rails_helper'

RSpec.describe 'Searches', type: :request do
  describe 'GET /Searches' do
    it 'GET /Searches path' do
      get searches_path
      expect(response.content_type).to eq 'text/html; charset=utf-8'
    end
  end
end
