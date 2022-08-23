require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  before do
    @user1 = User.create(name: 'Axel', photo: 'https.something.com', bio: 'This is a good story')
    @user2 = User.create(name: 'Alex', photo: 'https.photo.com', bio: 'a new story')
    @user3 = User.create(name: 'Ivan', photo: 'https.anotherphoto.com', bio: 'another story')
    Post.create(author: @user1, title: 'Hello', text: 'posts 3')
    Post.create(author: @user1, title: 'Hello', text: 'post 1')
    Post.create(author: @user1, title: 'Hello', text: 'posts 2')
    visit users_path
  end

  it 'all the content is rendering in the users page' do
    expect(page).to have_content('USERS')
    expect(page).to have_content('Name: Axel')
    expect(page).to have_content('Number of posts: 3')
    expect(page).to have_content('Name: Alex')
    expect(page).to have_content('Number of posts: 0')
    expect(page).to have_content('Name: Ivan')
    expect(page).to have_content('Number of posts: 0')
  end

  it 'Checking images' do
    expect(page).to have_xpath("//img[@src='https.something.com']")
    expect(page).to have_xpath("//img[@src='https.photo.com']")
    expect(page).to have_xpath("//img[@src='https.anotherphoto.com']")
  end

  it 'user links' do
    expect(page).to have_link(nil, href: user_path(@user1))
    expect(page).to have_link(nil, href: user_path(@user2))
    expect(page).to have_link(nil, href: user_path(@user3))
  end
end
