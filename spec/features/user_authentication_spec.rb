require 'rails_helper'

feature 'User authentication' do
  background do
    user = create(:user)
    visit '/'
  end

  scenario 'can log in from the index' do
    expect(page).to_not have_content('New Post')

    click_link 'Log In'
    fill_in 'Username', with: "Test User"
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    expect(page).to have_content("Signed in successfully.")
    expect(page).to_not have_content('Register')
    expect(page).to have_content('Logout')
  end

  scenario 'can log out once logged in' do
    click_link 'Log In'
    fill_in 'Username', with: "Test User"
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Logout'
    expect(page).to have_content('Signed out successfully')
  end

  scenario 'cannot view index posts without logging in' do
    visit '/posts'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

  scenario ' cannot create a new post without logging in' do
    visit new_post_path
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end 
end
