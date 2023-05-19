require 'rails_helper'

RSpec.describe 'Users Index Page', type: :feature, fat: true do
  before(:all) do
    @user = User.create(name: 'John Doe', bio: 'I am John Doe', email: 'rand_email2', photo: 'https://robohash.org/hey?set=set4')

    @user2 = User.create(name: 'Jann Doe', bio: 'I am Jann Doe', email: 'rand_email3', photo: 'https://robohash.org/ho?set=set4')
    @post = Post.create(user: @user, title: 'Hello', text: 'Teacher need to get trained')

    @post2 = Post.create(user: @user, title: 'Hello', text: 'My second post')

    @post3 = Post.create(user: @user2, title: 'Hello', text: 'My first post')
  end

  after(:all) do
    @user.destroy
    @user2.destroy
    @post.destroy
  end

  it 'displays a user UserName' do
    visit user_path(@user2)
    expect(page).to have_content('Jann Doe')
  end

  it 'displays number of posts' do
    visit user_path(@user2)
    expect(page).to have_content('No of posts: 1')
  end

  it 'displays a user bio' do
    visit user_path(@user2)
    expect(page).to have_content('I am Jann Doe')
  end

  it 'displays all users names' do
    visit users_path
    expect(page).to have_content('Jann Doe')
    expect(page).to have_content('Jann Doe')
  end

  it 'displays all users profile pictures' do
    visit users_path
    expect(page).to have_css("img[src*='https://robohash.org/hey?set=set4']")
    expect(page).to have_css("img[src*='https://robohash.org/ho?set=set4']")
  end

  it 'displays all the users post count' do
    visit users_path
    expect(page).to have_content('No of posts: 2')
    expect(page).to have_content('No of posts: 1')
  end

  it 'redirects to the users show page when clicked' do
    visit users_path

    find('a', text: 'Jann Doe', wait: 5).click
    sleep(2)

    assert_current_path(user_path(@user2))
  end
end
