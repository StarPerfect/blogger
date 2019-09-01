require 'rails_helper'

RSpec.describe 'Delete Article' do
  describe 'user sees a delete link on the article show page' do
    it 'can click link and go back to index where they do not see the deleted article' do
      article_1 = Article.create!(title: 'Title 1', body: 'Body 1')
      article_2 = Article.create!(title: 'Title 2', body: 'Body 2')

      visit article_path(article_1)

      click_link 'Delete'

      expect(current_path).to eq(articles_path)
      epect(page).to_not have_content(article_1.title)
      epect(page).to have_content(article_2.title)
    end
  end
end
