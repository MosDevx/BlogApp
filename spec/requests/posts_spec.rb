require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'renders a successful response' do
      # user = User.create! valid_attributes #1
      get user_posts_url(user_id: 1)
      expect(response).to be_successful # 3
    end
  end

  describe 'GET #show' do
    it 'renders the show template' do
      get user_post_url(user_id: 1, id: 1)
      expect(response).to render_template(:show)
    end

    it 'returns correct placeholder text' do
      get user_post_url(user_id: 1, id: 1)
      expect(response.body).to include('<h1>Post id is 1</h1>')
    end
  end
end
