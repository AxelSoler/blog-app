require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET users page #index' do
    before(:each) do
      get '/users'
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders index template' do
      expect(response).to render_template('index')
    end
    it 'body includes correct placeholder text' do
      assert_select "h2", 'list of all users'
    end
  end
  describe 'Show the chosen user' do
    before(:each) do
      get '/users/478'
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'show' template" do
      expect(response).to render_template('show')
    end
  end
end

RSpec.describe 'Posts', type: :request do
  describe 'GET posts page #index' do
    before(:each) do
      get '/users/326/posts'
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
  end
  describe 'Show the chosen post' do
    before(:each) do
      get '/users/326/posts/12'
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'show' template" do
      expect(response).to render_template('show')
    end
  end
end