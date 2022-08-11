require 'rails_helper'

RSpec.describe Post, type: :model do
  author = User.new(name: 'Axel', photo: 'https.something.com', bio: 'This is a good story', posts_counter: 2)
  author.save
  subject { Post.new(author: author, title: 'Hello', text: 'testing posts', comments_couter: 0, likes_counter: 4) }
  
  before { subject.save }

  it 'title should be Hello' do
    expect(subject.title).to eq('Hello')
  end

  it 'text should exist' do
    expect(subject.text).to eq('testing posts')
  end

  it 'comments_couter' do
    expect(subject.comments_couter).to eq(0)
  end

  it 'likes_counter' do
    expect(subject.likes_counter).to eq(4)
  end

  it 'should have an id' do
    expect(subject.author_id).not_to be_nil
  end

  it 'validate the title' do
    expect(subject.valid?).to be_truthy
  end

  it 'validate the title' do
    subject.title = nil
    expect(subject.valid?).to be_falsy
  end

  it 'validate the title length to be greater than 250' do
    subject.title = 'a' * 251
    expect(subject.valid?).to be_falsy
  end

  it 'validate comments_couter' do
    subject.comments_couter = -1
    expect(subject.valid?).to be_falsy
  end

  it 'validate likes_counter' do
    subject.likes_counter = -1
    expect(subject.valid?).to be_falsy
  end
end