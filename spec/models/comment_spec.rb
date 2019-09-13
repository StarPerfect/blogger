require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    it { should belong_to :article }
  end
end
