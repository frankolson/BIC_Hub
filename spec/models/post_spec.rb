require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:user) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end
end
