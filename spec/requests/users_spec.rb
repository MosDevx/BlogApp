require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /users/:id' do
    let!(:user) { User.create!(name: 'test', bio: 'hey there') }
    it 'returns the correct template' do
      get	user_path(user.id)
      expect(response).to render_template(:show)
    end
  end
end
