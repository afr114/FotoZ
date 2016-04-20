require 'rails_helper.rb'

feature 'User creates a post' do
  background do
    user = create(:user)
    login_as(user, :scope => :user)
    visit '/posts'
    click_link 'New Post'
  end

  scenario 'they see the post on the page' do
    attach_file('post_image', "spec/files/images/coffee.jpg")
    fill_in 'post_caption', with: 'nom nom nom #coffeetime'
    click_button 'Submit'
    expect(page).to have_content('#coffeetime')
    expect(page).to have_css("img[src*='coffee.jpg']")
    expect(page).to have_content('Arnie')
  end

  it 'needs an image to create post' do
    fill_in 'post_caption', with: 'There is no image here!'
    click_button 'Submit'
    expect(page).to have_content('New Post')
    expect(page).to have_content("Halt, you fiend! You need an image to post here!")
  end
end
