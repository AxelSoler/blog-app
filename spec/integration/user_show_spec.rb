require 'rails_helper'

RSpec.describe 'Users', type: :feature do
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
    visit user_path(@user2)
  end

  it 'all the content is rendering in the users page' do
    expect(page).to have_content('USER')
    expect(page).to have_content('Name: Alex')
    expect(page).to have_content('Number of posts: 5')
    expect(page).to have_content(@user2.bio)
    expect(page).to have_xpath("//img[@src='https.photo.com']")
  end

  it 'shoud have last 3 posts' do
    expect(page).to have_content(@post4.text)
    expect(page).to have_content(@post5.text)
    expect(page).to have_content(@post6.text)
    posts = page.all('.post')
    expect(posts.size).to eq(3)
  end

  it 'button to see all posts' do
    within('button.detailsbtn') do
      expect(page).to have_content('See all posts')
    end
  end

  it 'link to post show and index' do
    expect(page).to have_link(nil, href: user_post_path(@user2, @post4))
    expect(page).to have_link(nil, href: user_post_path(@user2, @post5))
    expect(page).to have_link(nil, href: user_post_path(@user2, @post6))
    expect(page).to have_link(nil, href: user_posts_path(@user2))
  end
end
