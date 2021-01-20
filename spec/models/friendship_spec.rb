require 'rails_helper'

RSpec.describe Friendship, type: :model do
   describe 'Create a like' do
    let(:testuser) { User.create(name: 'Katja', email: 'katja@microverse.org', password: '123456789') }
    let(:testuser2) { User.create(name: 'Masha', email: 'masha@microverse.org', password: '987654321') }
    subject { Friendship.create(user_id: testuser.id, friend_id: testuser2.id, confirmed: true) }

    it 'change the count of friendship by one' do
      expect { subject }.to change { Friendship.count }.by(1)
    end
end
end
