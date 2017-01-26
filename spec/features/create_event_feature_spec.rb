require 'rails_helper'

describe 'event creation' do
  let(:user) { create(:user, :confirmed) }

  before do
    sign_user_in(user)
    click_link 'Create Event'
  end

  it 'has a event creation form for the user' do
    expect(page).to have_field('event_name', placeholder: 'Event Name')
    expect(page).to have_field('event_time', placeholder: 'When is it?')
  end

  it 'requires the user to fill in the name field' do
    fill_in 'event_time', with: '2017/01/13 09:57'
    click_button 'create'
    expect(page).to have_content "Name can't be blank"
  end

  it 'requires the user to fill in the time field' do
    fill_in 'event_name', with: 'Dat Event'
    click_button 'create'
    expect(page).to have_content "Time can't be blank"
  end

  it 'has a show page after creation' do
    fill_in 'event_name', with: 'Dat Event'
    fill_in 'event_time', with: '2017/01/13 09:57'
    click_button 'create'

    visit event_path(Event.last)
    expect(page).to have_content 'Dat Event'
  end
end
