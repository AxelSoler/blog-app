require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Axel', photo: 'https.something.com', bio: 'This is a good story', posts_counter: 2) }
  
  before { subject.save }

  it 'name should be Axel' do
    expect(subject.name).to eq('Axel')
  end

  it 'photo should exist' do
    expect(subject.photo).to eq('https.something.com')
  end

  it 'bio should existl' do
    expect(subject.bio).to eq('This is a good story')
  end

  it 'posts_counter' do
    expect(subject.posts_counter).to eq(2)
  end

  it 'should have an id' do
    expect(subject.id).not_to be_nil
  end

  it 'validate the name' do
    subject.name = nil
    expect(subject.valid?).to be_falsy
  end

  it 'validate posts_counter' do
    subject.posts_counter = -1
    expect(subject.valid?).to be_falsy
  end

  it 'validate posts_counter' do
    subject.posts_counter = 0
    expect(subject.valid?).to be_truthy
  end
end