require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Create a post' do
    let(:testuser) { User.create(name: 'Katja', email: 'katja@gmail.com', password: '123456') }
    subject { Post.create(user_id: testuser.id, content: 'Post content') }

    it 'change the count of posts by one' do
      expect { subject }.to change { Post.count }.by(1)
    end
    it 'post content should be text' do
      expect(subject.content).to be_an_instance_of(String)
    end

    it 'post content should not be number' do
      expect(subject.content).to_not be_an_instance_of(Numeric)
    end

    it 'content length should be less than 1000' do
      expect(subject.content.length).to be < 1000
    end
end
end
