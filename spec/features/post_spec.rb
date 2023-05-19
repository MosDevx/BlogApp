require 'rails_helper'

RSpec.describe 'Posts Show', type: :feature do
  before(:all) do
    @user = User.create(name: 'Jann Doe', bio: 'I am John Doe', email: 'rand_email')
    @post = Post.create(user: @user, title: 'Hello', text: 'Teacher need to get trained')
    @comment = Comment.create(user: @user, post: @post, text: 'I agree')
  end

  after(:all) do
    @user.destroy
    @post.destroy
  end

  it 'displays all posts' do
    visit user_posts_path(@user)
    expect(page).to have_content('Post')
  end

  it 'displays who wrote the post' do
    visit user_posts_path(@user)
    expect(page).to have_content('Jann Doe')
  end

  it 'displays the title of the post' do
    visit user_posts_path(@user)
    expect(page).to have_content('Hello')
  end

  it 'displays the text of the post' do
    visit user_posts_path(@user)
    expect(page).to have_content('Teacher need to get trained')
  end

  it 'displays number of likes' do
    visit user_posts_path(@user)
    expect(page).to have_content('Likes: 0')
  end

  it 'displays a post' do
    visit user_post_path(user_id: @user.id, id: @post.id)
    expect(page).to have_content('Teacher')
  end

  it 'displays number of comments' do
    visit user_post_path(user_id: @user.id, id: @post.id)
    expect(page).to have_content('Comments: 1')
  end

  it 'displays user name of commentor' do
    visit user_post_path(user_id: @user.id, id: @post.id)
    expect(page).to have_content('Jann Doe :')
  end

  it 'displays comment text' do
    visit user_post_path(user_id: @user.id, id: @post.id)
    expect(page).to have_content('I agree')
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
