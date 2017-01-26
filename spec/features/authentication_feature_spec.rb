require 'rails_helper'

describe 'user authentication' do
  let(:user) {create(:user, :confirmed)}

  it 'allows signin with valid credentials' do
    sign_user_in(user)
    expect(page).to have_content('Signed in successfully')
  end

  it 'does not allow signin with invalid credentials'do
    sign_user_in(user, password: 'wrong_password')
    expect(page).to have_content('Invalid Email or password')
  end

  it 'allows user to sign out' do
    sign_user_in(user)

    click_link 'Sign out'
    expect(page).to have_content('Signed out successfully')
  end
end
