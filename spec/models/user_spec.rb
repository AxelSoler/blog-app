require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Axel', photo: 'https.something.com', bio: 'This is a good story', posts_counter: 2) }
  
  before { subject.save }

  it 'name should be Axel' do
    subject.name = 'Axel'
  end
end