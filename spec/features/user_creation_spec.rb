require 'rails_helper'

describe 'user creation' do
  before(:each) { sign_up_and_confirm }

  it 'allows user to create account' do
    expect(User.all.count).to eq(1)
  end
end
