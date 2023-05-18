require 'rails_helper'

RSpec.describe Post, type: :model do
  @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                   bio: 'Teacher from Mexico.')

  subject { described_class.new(title: 'This is a title', text: 'This is a text', user: @user) }

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a text' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an user_id' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a title longer than 20 characters' do
    subject.title = 'a' * 21
    expect(subject).to_not be_valid
  end

  it 'is not valid with a title shorter than 1 character' do
    subject.title = ''
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
