require 'rails_helper'

RSpec.describe 'Posts', type: :feature do
  before do
    @user1 = User.create(name: 'Axel', photo: 'https.something.com', bio: 'This is a good story')
    @user2 = User.create(name: 'Alex', photo: 'https.photo.com', bio: 'a new story')
    @user3 = User.create(name: 'Ivan', photo: 'https.anotherphoto.com', bio: 'another story')
    @post1 = Post.create(author: @user1, title: 'Hello', text: 'posts 2')
    @post2 = Post.create(author: @user2, title: 'Hello', text: 'posts 3')
    @post3 = Post.create(author: @user2, title: 'Hello', text: 'post 1')
    @post4 = Post.create(author: @user2, title: 'Hello', text: 'post 4')
    @post5 = Post.create(author: @user2, title: 'Hello', text: 'post 5')
    @post6 = Post.create(author: @user2, title: 'Hello', text: 'post 6')
    @comment1 = Comment.create(post: @post6, author: @user2, text: 'testing comments!')
    @comment2 = Comment.create(post: @post6, author: @user1, text: 'more comments!')
    @comment3 = Comment.create(post: @post6, author: @user3, text: 'new comments!')
    @comment4 = Comment.create(post: @post6, author: @user1, text: 'last comment!')
    @likes1 = Like.create(post: @post6, author: @user1)
    @likes2 = Like.create(post: @post6, author: @user2)
    @likes3 = Like.create(post: @post6, author: @user3)
    visit user_post_path(@user2, @post6)
  end

  it 'all the content is rendering in the post page' do
    expect(page).to have_content('POST')
    expect(page).to have_content('by Alex')
    expect(page).to have_content('Comments: 4')
    expect(page).to have_content('Likes: 3')
    expect(page).to have_content(@post6.text)
  end

  it 'Post has a comment with text and author' do
    expect(page).to have_content(@comment1.text)
    expect(page).to have_content(@comment1.author.name)
    expect(page).to have_content(@comment2.text)
    expect(page).to have_content(@comment2.author.name)
    expect(page).to have_content(@comment3.text)
    expect(page).to have_content(@comment3.author.name)
    expect(page).to have_content(@comment4.text)
    expect(page).to have_content(@comment4.author.name)
  end
end
