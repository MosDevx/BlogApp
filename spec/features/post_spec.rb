require 'rails_helper'

RSpec.describe 'Posts', type: :feature, feat: true do
  before(:all) do
    @user = User.create(name: 'Jann Doe', bio: 'I am John Doe', email: 'rand_email')
    @post = Post.create(user: @user, title: 'Hello', text: 'Teacher need to get trained')
  end

  after(:all) do
    @user.destroy
    @post.destroy
  end

  it 'displays all posts' do
    visit user_posts_path(@user)
    expect(page).to have_content('Post')
  end

  it 'displays a post' do
    visit user_post_path(user_id: @user.id, id: @post.id)
    expect(page).to have_content('Teacher')
  end

  it 'redirects to all posts page when button is clicked' do
    visit user_path(@user)
    click_button 'See All Posts'
    expect(page).to have_content('All Posts')
  end

  it 'displays button to see all posts' do
    visit user_path(@user)
    expect(page).to have_selector(:link_or_button, 'See All Posts')
  end
end
