require 'rails_helper'

RSpec.feature 'Users', type: :feature, fet: true do
  before(:all) do
    @user = User.create(name: 'Jann Doe', bio: 'I am Jann Doe', email: 'rand_email@email.com' , photo: 'https://robohash.org/hey?set=set4')
    @post = Post.create(user_id: @user.id, title: 'Hello', text: 'Teacher need to get trained')
    @post2 = Post.create(user_id: @user.id, title: 'Hello', text: 'My second post')
    @post3 = Post.create(user_id: @user.id, title: 'Hello', text: 'My third post')

  end

  after(:all) do
    @user.destroy
    @post.destroy
  end

  it 'displays all users' do
    visit users_path
    expect(page).to have_content('Users')
    # sleep(5)
  end

  it 'displays a user UserName' do
    # user = User.create(name: 'John Doe', bio: 'I am John Doe')
    # puts user.id
    visit user_path(@user)
    expect(page).to have_content('Jann Doe')
    # sleep(5)
  end

  it 'displays a users profile picture' do
    # user = User.create(name: 'John Doe', bio: 'I am John Doe')
    visit user_path(@user)
    expect(page).to have_css("img[src*='https://robohash.org/hey?set=set4']")
    # sleep(5)
  end

  it 'displays number of posts' do
    # user = User.create(name: 'John Doe', bio: 'I am John Doe')
    visit user_path(@user)
    # sleep(5)
    expect(page).to have_content('No of posts: 3')
  end

  it 'displays a user bio' do
    # user = User.create(name: 'John Doe', bio: 'I am John Doe')
    visit user_path(@user)
    expect(page).to have_content('I am Jann Doe') 
    # sleep(5)
  end

  it 'displays a users 3 most recent posts' do
    # user = User.create(name: 'John Doe', bio: 'I am John Doe')
    visit user_path(@user)
    expect(page).to have_content('My third post')
    expect(page).to have_content('My second post')
    expect(page).to have_content('Teacher need to get trained')
    # sleep(5)
  end

  it 'displays button to see all posts' do
    # user = User.create(name: 'John Doe', bio: 'I am John Doe')
    visit user_path(@user)
    expect(page).to have_selector(:link_or_button, 'See All Posts')
    # sleep(5)
  end

  it 'redirects to all posts page when button is clicked' do
    # user = User.create(name: 'John Doe', bio: 'I am John Doe')
    visit user_path(@user)
    click_button 'See All Posts'
    expect(page).to have_content('All Posts')
    # sleep(5)
  end

  it 'redirects to post page when post is clicked' do
    # user = User.create(name: 'John Doe', bio: 'I am John Doe')
    visit user_path(@user)
    click_on 'My third post'
    expect(page).to have_content('My third post')
    # sleep(5)
  end



  it 'displays a user edit page' do
    # user = User.create(name: 'John Doe', bio: 'I am John Doe')
    visit edit_user_path(@user)
    expect(page).to have_content('Edit User')
    # sleep(5)
  end
end
