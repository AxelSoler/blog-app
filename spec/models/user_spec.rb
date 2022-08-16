require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Axel', photo: 'https.something.com', bio: 'This is a good story', posts_counter: 2) }

  before { subject.save }

  it 'testing data' do
    expect(subject.name).to eq('Axel')
    expect(subject.photo).to eq('https.something.com')
    expect(subject.bio).to eq('This is a good story')
    expect(subject.posts_counter).to eq(2)
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

  it 'recent_posts_user should return last 3 posts' do
    post1 = Post.new(author: subject, title: 'Hello', text: 'testing hello', comments_counter: 0, likes_counter: 4)
    post1.save
    post2 = Post.new(author: subject, title: 'news', text: 'testing the news', comments_counter: 2, likes_counter: 0)
    post2.save
    post3 = Post.new(author: subject, title: 'testing', text: 'testing testing', comments_counter: 5, likes_counter: 0)
    post3.save
    post4 = Post.new(author: subject, title: 'Axel', text: 'testing names', comments_counter: 0, likes_counter: 17)
    post4.save
    post5 = Post.new(author: subject, title: 'title', text: 'testing title', comments_counter: 3, likes_counter: 3)
    post5.save
    post6 = Post.new(author: subject, title: 'games', text: 'testing games', comments_counter: 1, likes_counter: 64)
    post6.save
    post7 = Post.new(author: subject, title: '48', text: 'testing numbers', comments_counter: 0, likes_counter: 4)
    post7.save
    post8 = Post.new(author: subject, title: 'bye', text: 'testing bye', comments_counter: 0, likes_counter: 1)
    post8.save
    expect(subject.recent_posts_user).to eq([post8, post7, post6])
  end
end
