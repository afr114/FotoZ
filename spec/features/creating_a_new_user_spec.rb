feature 'User can register to website' do
  background do
    visit '/'
    click_link 'Sign Up'
  end

  scenario 'can create a new user via the index page' do
    fill_in 'Username', with: 'username1'
    fill_in 'Email', with: 'username1@myspace.com'
    fill_in 'Password', with: 'password1'
    fill_in 'Password confirmation', with: 'password1'
    click_button 'Sign Up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'requires a user name to successfully create an account' do
    fill_in 'Email', with: 'username1@myspace.com'
    fill_in 'Password', with: 'password1', match: :first
    fill_in 'Password confirmation', with: 'password1'
    click_button 'Sign Up'
    expect(page).to have_content('You need a user name to create an account.')
  end

  scenario 'requires a user name to be more than 4 characters' do
    fill_in 'Username', with: 'a'
    fill_in 'Email', with: 'username1@myspace.com'
    fill_in 'Password', with: 'password1', match: :first
    fill_in 'Password confirmation', with: 'password1'
    click_button 'Sign Up'
    expect(page).to have_content('minimum is 4 characters')
  end

  scenario 'requires a user name to be less than 12 characters' do
    fill_in 'Username', with: 'thisisonlyatestforyou'
    fill_in 'Email', with: 'username1@myspace.com'
    fill_in 'Password', with: 'password1', match: :first
    fill_in 'Password confirmation', with: 'password1'
    click_button 'Sign Up'
    expect(page).to have_content('maximum is 12 characters')
  end
end
