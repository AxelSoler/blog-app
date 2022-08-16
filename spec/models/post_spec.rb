require 'rails_helper'

RSpec.describe Post, type: :model do
  author = User.new(name: 'Axel', photo: 'https.something.com', bio: 'This is a good story', posts_counter: 2)
  author.save
  subject { Post.new(author:, title: 'Hello', text: 'testing posts', comments_counter: 0, likes_counter: 4) }

  before { subject.save }

  it 'author posts_counter should be 3' do
    expect(author.posts_counter).to eq(3)
  end

  it 'testing data' do
    expect(subject.title).to eq('Hello')
    expect(subject.text).to eq('testing posts')
    expect(subject.comments_counter).to eq(0)
    expect(subject.likes_counter).to eq(4)
    expect(subject.author_id).not_to be_nil
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

  it 'validate comments_counter' do
    subject.comments_counter = -1
    expect(subject.valid?).to be_falsy
  end

  it 'validate likes_counter' do
    subject.likes_counter = -1
    expect(subject.valid?).to be_falsy
  end

  it 'recent_post_coments should return last 5 comments' do
    comment1 = Comment.new(post: subject, author:, text: '1')
    comment1.save
    comment2 = Comment.new(post: subject, author:, text: '2')
    comment2.save
    comment3 = Comment.new(post: subject, author:, text: '3')
    comment3.save
    comment4 = Comment.new(post: subject, author:, text: '4')
    comment4.save
    comment5 = Comment.new(post: subject, author:, text: '5')
    comment5.save
    comment6 = Comment.new(post: subject, author:, text: '6')
    comment6.save
    comment7 = Comment.new(post: subject, author:, text: '7')
    comment7.save
    comment8 = Comment.new(post: subject, author:, text: '8')
    comment8.save
    expect(subject.recent_post_coments).to eq([comment8, comment7, comment6, comment5, comment4])
  end
end
