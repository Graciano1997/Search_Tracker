require 'rails_helper'

RSpec.describe Search, type: :model do
  context 'Instance of a Search' do
    it 'Expect to be an instance of Search' do
      search = Search.new
      expect(search).to be_an_instance_of(Search)
    end
  end

  context 'with invalid params' do
    it 'Should not be a valid Search with no params' do
      search = Search.new
      expect(search).to_not be_valid
    end

    it 'Should not be a valid Search with 1 param' do
      search = Search.new
      search.query = 'Helpjuice'
      expect(search).to_not be_valid
    end
  end

  context 'with Valid params' do
    it 'Should save a new Search wit valid params' do
      search = Search.new
      search.query = 'Helpjuice'
      search.ip_address = '127.0.0.1'
      expect(search).to be_valid
    end
  end
end
