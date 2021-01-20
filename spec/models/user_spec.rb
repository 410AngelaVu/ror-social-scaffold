require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Create a user' do
    subject { User.create(name: 'Katja', email: 'katja@microverse.org', password: '123456789') }

    it 'change the count of users by one' do
      expect { subject }.to change { User.count }.by(1)
    end
    it 'returns Katja' do
      expect(subject.name).to eq('Katja')
    end

    it "it doesn't return Masha" do
      expect(subject.name).to_not eq('Masha')
    end

    it 'email have email format' do
      expect(subject.email).to match(/[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+/)
    end

    it 'email will not have other format' do
      expect(subject.email).to_not match(/^[a-z0-9_-]{3,15}$/)
    end

    it 'username length is less than 20' do
      expect(subject.name.length).to be < 20
    end
  end
end
