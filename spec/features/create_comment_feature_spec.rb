require 'rails_helper'

describe 'comment creation' do
  let(:user) { create(:user, :confirmed) }

  before do
    sign_user_in(user)
  end

  context 'for posts' do
    let(:post) { create(:post, user: user) }

    before do
      visit post_path(post)
    end

    it 'has a form a form to allow users to comment' do
      expect(page).to have_field('comment_text', placeholder: 'Enter Comment')
    end
  end

  context 'for events' do
    let(:event) { create(:event, user: user) }

    before do
      visit event_path(event)
    end

    it 'has a form a form to allow users to comment' do
      expect(page).to have_field('comment_text', placeholder: 'Enter Comment')
    end
  end

end
