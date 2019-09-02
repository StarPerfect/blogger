require 'rails_helper'

RSpec.describe 'Editing an Article' do
  describe 'visits article show page' do
    describe 'click Edit link' do
      it 'can update the article from a form' do
        article = Article.create(title: 'Test Article', body: 'Test Body')

        visit articles_path(article)

        click_link article.title

        click_link 'Edit'

        fill_in 'article[title]', with: 'Updated Title'
        fill_in 'article[body]', with: 'Updated Body Text'

        click_button 'Update'

        expect(page).to have_content('Updated Title')
        expect(page).to have_content('Updated Body Text')
        expect(page).to have_content("Article 'Updated Title' has been updated.")
      end
    end
  end
end
