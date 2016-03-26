require 'rails_helper.rb'

feature 'User can check index for list of all posts' do
  scenario 'they see the posts on the index page' do
    post_1 = create(:post, caption: "This is post1")
    post_2 = create(:post, caption: "This is post2")

    visit '/'
    expect(page).to have_content("This is post1")
    expect(page).to have_content("This is post2")
    expect(page).to have_css("img[src*='coffee.jpg']")
  end

  scenario 'they click on image to see an individual post' do
    post = create(:post)

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq(post_path(post))
  end

end
