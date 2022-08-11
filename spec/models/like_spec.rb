require 'rails_helper'

RSpec.describe Like, type: :model do
  author = User.new(name: 'Axel', photo: 'https.something.com', bio: 'This is a good story', posts_counter: 2)
  author.save
  post = Post.new(author:, title: 'Hello', text: 'this a post', comments_couter: 0, likes_counter: 4)
  post.save
  subject { Like.new(post:, author:) }
  before { subject.save }

  it 'author likes_counter should be 5' do
    expect(post.likes_counter).to eq(5)
  end

  it 'should have an author_id' do
    expect(subject.author_id).not_to be_nil
  end

  it 'should have a post_id' do
    expect(subject.post_id).not_to be_nil
  end
end
