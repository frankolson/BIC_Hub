require 'rails_helper'

describe 'post creation' do
  let(:user) { create(:user, :confirmed) }

  before do
    sign_user_in(user)
  end

  it 'happens on the signed in root url' do
    expect(page).to have_content "Update Status"
  end

  it 'requires the user to fill in the content field' do
    click_button 'Post'
    expect(page).to have_content "Content can't be blank"
  end

  it 'has a show page after creation' do
    fill_in 'post_content', with: 'Nonsense'
    click_button 'Post'

    visit post_path(Post.last)
    expect(page).to have_content 'Nonsense'
  end
end
