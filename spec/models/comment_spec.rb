require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Create a comment' do
    let(:testuser) { User.create(name: 'Katja', email: 'katja@gmail.com', password: '123456789') }
    let(:testpost) { Post.create(user_id: testuser.id, content: 'Post content') }
    subject { Comment.create(user_id: testuser.id, post_id: testpost.id, content: 'comment content') }

    it 'change the count of comments by one' do
      expect { subject }.to change { Comment.count }.by(1)
    end
    it 'comment content should be text' do
      expect(subject.content).to be_an_instance_of(String)
    end

    it 'comment content should not be numeric' do
      expect(subject.content).to_not be_an_instance_of(Numeric)
    end
    it 'content length should be less than 200' do
      expect(subject.content.length).to be < 200
    end
  end
end
