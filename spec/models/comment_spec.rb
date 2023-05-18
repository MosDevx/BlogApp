require 'rails_helper'

RSpec.describe Comment, type: :model do
  @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                   bio: 'Teacher from Mexico.')

  @post = Post.new(user: @user, title: 'Hello', text: 'Teacher need to get trained')

  subject { described_class.new(text: 'This is a comment', user: @user, post: @post) }

  it 'is not valid without a text' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an user_id' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a post_id' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a text longer than 1000 characters' do
    subject.text = 'a' * 1001
    expect(subject).to_not be_valid
  end

  it 'is not valid with a text shorter than 1 character' do
    subject.text = ''
    expect(subject).to_not be_valid
  end
end
