require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: 'John Doe', bio: 'I am John Doe') }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a bio' do
    subject.bio = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a name longer than 20 characters' do
    subject.name = 'a' * 21
    expect(subject).to_not be_valid
  end

  it 'is not valid with a bio longer than 100 characters' do
    subject.bio = 'a' * 101
    expect(subject).to_not be_valid
  end
end
