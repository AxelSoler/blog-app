require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET users page #index' do
    it "is a success" do
      get "/users"
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      get "/users"
      expect(response).to render_template('index')
    end
  end
end
