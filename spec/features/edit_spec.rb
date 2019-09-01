require 'rails_helper'

RSpec.describe 'Editing an Article' do
  describe 'visits article show page' do
    describe 'click Edit link' do
      it 'can update the article from a form' do
        visit articles_path(@article)

        click_link 'Edit'

        fill_in 'article[title]', with: 'Updated Title'
        fill_in 'article[body]', with: 'Updated Body Text'

        click_button 'Update'

        expect(current_path).to eq(articles_path(@article))
        expect(page).to have_content('Updated Title')
        expect(page).to have_content('Updated Body Text')
      end
    end
  end
end
