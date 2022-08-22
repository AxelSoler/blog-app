require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before do
    @user = User.create(name: 'Axel', photo: 'https.something.com', bio: 'This is a good story', posts_counter: 2)
  end

  describe 'GET users page #index' do
    before(:each) do
      get users_path
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders index template' do
      expect(response).to render_template('index')
    end
    it 'body includes correct placeholder text' do
      assert_select 'h2', 'LIST OF USERS'
    end
  end
  describe 'Show the chosen user' do
    before(:each) do
      get user_path(@user.id)
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'show' template" do
      expect(response).to render_template('show')
    end
    it 'body includes correct placeholder text' do
      assert_select 'h2', 'USER'
    end
  end
end

RSpec.describe 'Posts', type: :request do
  before do
    @user = User.create(name: 'Axel', photo: 'https.something.com', bio: 'This is a good story', posts_counter: 2)
    @post = Post.create(author: @user, title: 'Hello', text: 'testing posts', comments_counter: 0, likes_counter: 4)
  end
  describe 'GET posts page #index' do
    before(:each) do
      get user_posts_path(@user.id)
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
    it 'body includes correct placeholder text' do
      assert_select 'h2', 'list of all posts for a given user'
    end
  end
  describe 'Show the chosen post' do
    before(:each) do
      get user_post_path(@user.id, @post.id)
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'show' template" do
      expect(response).to render_template('show')
    end
    it 'body includes correct placeholder text' do
      assert_select 'h2', 'POST'
    end
  end
end
