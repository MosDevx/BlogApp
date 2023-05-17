require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let!(:user) { User.create!(name: 'test', bio: 'hey there') }
  let!(:post) { Post.create!(title: 'test', text: 'hey there', user:) }

  describe 'GET /index' do
    it 'renders a successful response' do
      # user = User.create! valid_attributes #1
      get user_posts_url(user.id)
      expect(response).to be_successful # 3
    end
  end

  describe 'GET #show' do
    it 'renders the show template' do
      get user_post_url(user.id, post.id)
      expect(response).to render_template(:show)
    end
  end
end
