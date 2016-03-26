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
    click_button 'Create Post'
    expect(page).to have_content("Post updated hombre.")
    expect(page).to have_content("Oh god, you weren’t meant to see this picture!")
  end

end
