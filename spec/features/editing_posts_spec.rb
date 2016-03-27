require 'rails_helper.rb'

feature 'User can edit a post' do
  background do
    post_1 = create(:post, caption: "This is post1")

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end

  scenario 'they see an updated post' do
    fill_in 'post_caption', with: 'Oh god, you weren’t meant to see this picture!'
    click_button 'Submit'
    expect(page).to have_content("Post updated hombre.")
    expect(page).to have_content("Oh god, you weren’t meant to see this picture!")
  end

    it 'needs a new image or caption to update post' do
    attach_file('post_image', 'spec/files/coffee.zip')
    click_button 'Submit'
    expect(page).to have_content("Error updating post")
  end
end
