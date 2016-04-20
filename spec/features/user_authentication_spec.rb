require 'rails_helper'

feature 'User authentication' do
  let(:user) {FactoryGirl.create(:user)}
  before(:each) { sign_in_with (user) }

  scenario 'can log in from the index' do
    expect(page).to_not have_content('New Post')
    click_button 'Log in'
    expect(page).to have_content("Signed in successfully.")
    expect(page).to_not have_content('Register')
    expect(page).to have_content('Logout')
  end

  scenario 'can log out once logged in' do
    click_button 'Log in'
    click_on 'Logout'
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
