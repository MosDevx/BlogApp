require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  before(:all) do
    @user = User.create(name: 'Jann Doe', bio: 'I am Jann Doe', email: 'ran.com', photo: 'https://robohash.org/hey?set=set4')
    @post = Post.create(user_id: @user.id, title: 'Hello', text: 'Teacher need to get trained')
    @post2 = Post.create(user_id: @user.id, title: 'Hello', text: 'My second post')
    @post3 = Post.create(user_id: @user.id, title: 'Hello', text: 'My third post')
  end

  after(:all) do
    @user.destroy
    @post.destroy
    @post2.destroy
    @post3.destroy
  end

  it 'displays a users profile picture' do
    visit user_path(@user)
    expect(page).to have_css("img[src*='https://robohash.org/hey?set=set4']")
  end

  it 'displays a user UserName' do
    visit user_path(@user)
    expect(page).to have_content('Jann Doe')
  end
end

RSpec.feature 'User show', type: :feature do
  before(:all) do
    @user = User.create(name: 'Jann Doe', bio: 'I am Jann Doe', email: 'ran.com', photo: 'https://robohash.org/hey?set=set4')
    @post = Post.create(user_id: @user.id, title: 'Hello', text: 'Teacher need to get trained')
    @post2 = Post.create(user_id: @user.id, title: 'Hello', text: 'My second post')
    @post3 = Post.create(user_id: @user.id, title: 'Hello', text: 'My third post')
  end

  after(:all) do
    @user.destroy
    @post.destroy
    @post2.destroy
    @post3.destroy
  end

  it 'displays a user bio' do
    visit user_path(@user)
    expect(page).to have_content('I am Jann Doe')
  end
  it 'displays button to view all posts' do
    visit user_path(@user)
    expect(page).to have_content('See All Posts')
  end

  it 'redirects to all posts page when view all posts is clicked' do
    visit user_path(@user)
    click_button 'See All Posts'
    expect(page).to have_content('My third post')
    expect(page).to have_content('My second post')
    expect(page).to have_content('Teacher need to get trained')
  end
end

RSpec.feature 'User show', type: :feature do
  before(:all) do
    @user = User.create(name: 'Jann Doe', bio: 'I am Jann Doe', email: 'ran.com', photo: 'https://robohash.org/hey?set=set4')
    @post = Post.create(user_id: @user.id, title: 'Hello', text: 'Teacher need to get trained')
    @post2 = Post.create(user_id: @user.id, title: 'Hello', text: 'My second post')
    @post3 = Post.create(user_id: @user.id, title: 'Hello', text: 'My third post')
  end

  after(:all) do
    @user.destroy
    @post.destroy
    @post2.destroy
    @post3.destroy
  end
  it 'displays a users 3 most recent posts' do
    visit user_path(@user)
    expect(page).to have_content('My third post')
    expect(page).to have_content('My second post')
    expect(page).to have_content('Teacher need to get trained')
  end

  it 'displays number of posts' do
    visit user_path(@user)
    expect(page).to have_content('No of posts: 3')
  end
  it 'redirects to post show page when post is clicked' do
    visit user_path(@user)
    click_on 'My third post'
    expect(page).to have_content('My third post')
  end
end
