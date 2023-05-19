require 'rails_helper'

RSpec.feature "Users", type: :feature , feat:true do

  before(:all) do 
    @user = User.create(name: 'Jann Doe', bio: 'I am John Doe',email:"rand_email")
  end
  
  after(:all) do
    @user.destroy
  end
  
  it 'displays all users' do
    visit users_path
    expect(page).to have_content('Users')
  end
  
  it 'displays a user' do
    # user = User.create(name: 'John Doe', bio: 'I am John Doe')
    # puts user.id
    visit user_path(@user)
    expect(page).to have_content('John Doe')
  end
  
  it 'displays a user edit page' do
    # user = User.create(name: 'John Doe', bio: 'I am John Doe')
    visit edit_user_path(@user)
    expect(page).to have_content('Edit User')
  end
  
  
end
