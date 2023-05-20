require 'rails_helper'

RSpec.describe 'Posts Index', type: :feature do
  before(:all) do
    @user = User.create(name: 'Jann Doe', bio: 'I am John Doe', email: 'rand_email', photo: 'https://robohash.org/hey?set=set4')
    @post = Post.create(user: @user, title: 'Hello', text: 'Teacher need to get trained')
    @post1 = Post.create(user: @user, title: 'Hello1', text: 'Teacher need to get trained2')
    @post2 = Post.create(user: @user, title: 'Hello2', text: 'Teacher need to get trained3')
    @comment = Comment.create(user: @user, post: @post, text: 'I agree')
  end

  after(:all) do
    @user.destroy
    @post.destroy
    @post1.destroy
    @post2.destroy
    @comment.destroy
  end

  it 'displays users profile picture' do
    visit user_posts_path(@user)
    expect(page).to have_css("img[src*='https://robohash.org/hey?set=set4']")
  end

  it 'displays users name' do
    visit user_posts_path(@user)
    expect(page).to have_content('Jann Doe')
  end

  it 'displays number of posts by user' do
    visit user_posts_path(@user)
    expect(page).to have_content('No of posts: 3')
  end

  it 'displays posts title' do
    visit user_posts_path(@user)
    expect(page).to have_content('Hello')
  end

  it 'displays posts text' do
    visit user_posts_path(@user)
    expect(page).to have_content('Teacher need to get trained2')
  end

  it 'displays posts comments' do
    visit user_posts_path(@user)
    expect(page).to have_content('Teacher need to get trained2')
  end

  it 'displays posts comments count' do
    visit user_posts_path(@user)
    expect(page).to have_content('Comments: 0')
  end

  it 'displays posts like count' do
    visit user_posts_path(@user)
    expect(page).to have_content('Likes: 0')
  end

  it 'redirects to show page when post title is clicked' do
    visit user_posts_path(@user)
    click_link('Hello')
    expect(page).to have_content('Hello')
  end

  it 'will paginate posts' do
    visit user_posts_path(@user)
    expect(page).to have_content('Next')
    expect(page).to have_content('Last')
  end
end
