require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  it 'title = USERS' do 
    visit users_path
    expect(page).to have_content("USERS")
  end
end
