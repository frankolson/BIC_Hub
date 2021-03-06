require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:comment) }
    it { should validate_presence_of(:commentable) }
    it { should validate_presence_of(:user) }
  end

  describe 'associations' do
    it { should belong_to(:commentable) }
    it { should belong_to(:user) }
  end
end
