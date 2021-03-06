require 'rails_helper.rb'

feature 'User can check index for list of all posts' do
  background do
    user = create(:user)
    login_as(user, :scope => :user)
  end
  
  scenario 'they see the posts on the index page' do
    post_1 = create(:post, caption: "This is post1")
    post_2 = create(:post, caption: "This is post2")

    visit '/posts'
    expect(page).to have_content("This is post1")
    expect(page).to have_content("This is post2")
    expect(page).to have_css("img[src*='coffee.jpg']")
  end

  scenario 'they click on image to see an individual post' do
    post = create(:post)

    visit '/posts'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq(post_path(post))
  end

end
