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

    it 'can fill in comment form and see comment on that article' do
      article = Article.create!(title: 'New Title', body: 'New Body')

      visit article_path(article)

      fill_in "comment[author_name]", with: 'ME!'
      fill_in "comment[body]", with: 'So many thoughts on this article.'

      click_on 'Submit'

      expect(current_path).to eq(article_path(article))
      expect(page).to have_content('Post a Comment')
      expect(page).to have_content('ME!')
      expect(page).to have_content('So many thoughts on this article.')
    end
  end
end
