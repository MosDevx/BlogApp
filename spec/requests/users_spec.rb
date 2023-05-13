require 'rails_helper'

RSpec.describe 'Users', type: :request, new: true do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns the correct template' do
      get '/users/1'
      expect(response).to render_template(:show)
    end

    it 'returns the correct html placeholder text' do
      get '/users/1'
      expect(response.body).to include('<h1>User ID is 1</h1>')
    end
  end
end
