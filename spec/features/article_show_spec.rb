require 'rails_helper'

RSpec.describe 'Article Show Page' do
  describe 'they link from the articles index' do
    it 'displays information for one article' do
      new_article = Article.create!(title: 'New Title', body: 'New Body')
      comment_1 = new_article.comments.create(author_name: 'Me', body: 'Commenty comments')
      comment_2 = new_article.comments.create(author_name: 'You', body: 'So much to say!')

      visit articles_path

      click_link new_article.title

      expect(page).to have_content(new_article.title)
      expect(page).to have_content(new_article.body)
      expect(page).to have_content(comment_1.author_name)
      expect(page).to have_content(comment_1.body)
      expect(page).to have_content(comment_2.author_name)
      expect(page).to have_content(comment_2.body)
    end
  end
end
