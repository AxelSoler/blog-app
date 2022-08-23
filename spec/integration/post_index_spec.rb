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
    visit user_posts_path(@user2)
  end

  it 'all the content is rendering in the users page' do
    expect(page).to have_content('list of all posts for a given user')
    expect(page).to have_content('Name: Alex')
    expect(page).to have_content('Number of posts: 5')
    expect(page).to have_xpath("//img[@src='https.photo.com']")
  end

  it 'shoud have 5 posts' do
    posts = page.all('.post')
    expect(posts.size).to eq(5)
  end

  it 'link to post show' do
    expect(page).to have_link(nil, href: user_post_path(@user2, @post2))
    expect(page).to have_link(nil, href: user_post_path(@user2, @post3))
    expect(page).to have_link(nil, href: user_post_path(@user2, @post4))
    expect(page).to have_link(nil, href: user_post_path(@user2, @post5))
    expect(page).to have_link(nil, href: user_post_path(@user2, @post6))
  end
end
