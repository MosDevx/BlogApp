require 'rails_helper'

RSpec.feature "Users", type: :feature , feat:true do

  it 'displays all users' do
    visit users_path
    expect(page).to have_content('Users')
  end

  it 'displays a user' do
    user = User.new(name: 'John Doe', bio: 'I am John Doe')
    user.save
    visit user_path(user)
    expect(page).to have_content('John Doe')
  end



end
