require 'rails_helper'

RSpec.describe 'Create New Article' do
  describe 'user follows create a new article link' do
    it 'can complete new article form and create a new resource' do
      visit articles_path

      click_link 'Create a New Article'

      expect(current_path).to eq(new_article_path)

      fill_in 'article[title]', with: 'Article Show Test Title'
      fill_in 'article[body]', with: 'Show article body'

      click_button 'Create'

      expect(page).to have_content('Article Show Test Title')
      expect(page).to have_content('Show article body')
      expect(page).to have_content("Article 'Article Show Test Title' has been created.")
    end
  end
end
