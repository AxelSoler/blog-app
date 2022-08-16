require 'rails_helper'

RSpec.describe Comment, type: :model do
  author = User.new(name: 'Axel', photo: 'https.something.com', bio: 'This is a good story', posts_counter: 2)
  author.save
  post = Post.new(author:, title: 'Hello', text: 'this a post', comments_counter: 0, likes_counter: 4)
  post.save
  subject { Comment.new(post:, author:, text: 'testing comments!') }
  before { subject.save }

  it 'author posts_counter should be 1' do
    expect(post.comments_counter).to eq(1)
  end

  it 'text should exist' do
    expect(subject.text).to eq('testing comments!')
  end

  it 'should have an author_id' do
    expect(subject.author_id).not_to be_nil
  end

  it 'should have a post_id' do
    expect(subject.post_id).not_to be_nil
  end
end
