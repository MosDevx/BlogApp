require 'rails_helper'

RSpec.describe 'users/index.html.erb', type: :feature, new:true do
	let!(:user) { User.create(name: 'Tati', bio: 'Coding', photo: 'https://avatars.githubusercontent.com/u/80094659?v=4') }

	before do
    visit users_path
  end

	describe 'GET /users' do
		it 'displays users' do
			# visit users_path
			
			expect(page).to have_content(' ')
		end
	end
end
