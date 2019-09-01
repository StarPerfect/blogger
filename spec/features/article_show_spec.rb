require 'rails_helper'

RSpec.describe 'Article Show Page' do
  describe 'they link from the articles index' do
    it 'displays information for one article' do
      # visit articles_path
      #
      # click_link 'Create a New Article'
      #
      # fill_in :title, with: 'Article Show Test Title'
      # fill_in :body, with: 'Show article body'
      #
      # click_button 'Save'

      new_article = Article.create!(title: 'New Title', body: 'New Body')

      visit articles_path

      click_link new_article.title

      expect(page).to have_content(new_article.title)
      expect(page).to have_content(new_article.body)
    end
  end
end
