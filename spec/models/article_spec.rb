require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'Instance of a Article' do
    it 'Expect to be an instance of Article' do
      article = Article.new
      expect(article).to be_an_instance_of(Article)
    end
  end

  context 'with invalid params' do
    it 'Should not be a valid Article with no params' do
      article = Article.new
      expect(article).to_not be_valid
    end

    it 'Should not be a valid Article with 1 param' do
      article = Article.new
      article.title = 'Helpjuice'
      expect(article).to_not be_valid
    end
  end

  context 'with Valid params' do
    it 'Should save a new Article wit valid params' do
      article = Article.new
      article.title = 'Helpjuice'
      article.text = 'A company'
      expect(article).to be_valid
    end
  end
end
