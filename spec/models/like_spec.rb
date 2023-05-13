require 'rails_helper'

RSpec.describe Like, type: :model do
  @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                   bio: 'Teacher from Mexico.')
  @post = Post.new(author: @user, title: 'Hello', text: 'Teacher need to get trained')

  subject { described_class.new(author: @user, post: @post) }

  it 'is not valid without an author_id' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a post_id' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end
end
