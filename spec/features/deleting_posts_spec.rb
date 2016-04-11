require 'rails_helper.rb'

feature 'User can delete a post' do
  background do
    post_1 = create(:post, caption: "This is post1")
    visit '/posts'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
  end

  scenario 'they see index page without deleted post' do
    click_link 'Delete Post'
    expect(page.current_path).to eq(posts_path)
    expect(page).to have_content("Problem solved!  Post deleted.")
    expect(page).not_to have_content("This is post1")
  end
end
