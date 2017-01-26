def sign_up
  visit new_user_registration_path

  fill_in 'First name', with: 'Frank'
  fill_in 'Last name', with: 'Olson'
  fill_in 'Email', with: 'frank@dringo.io'
  fill_in 'Password', with: 'ye$hallNotHAndshake'
  fill_in 'Password confirmation', with: 'ye$hallNotHAndshake'
  click_button 'Sign up'
end

def sign_up_and_confirm
  sign_up
  User.last.update_attribute(:confirmed_at, Time.now)
end

def sign_user_in(user, opts={})
  visit new_user_session_path
  fill_in 'Email', with: user.email
  fill_in 'Password', with: (opts[:password] || user.password)
  click_button 'Sign in'
end
