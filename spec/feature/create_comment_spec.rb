require 'rails_helper'

RSpec.describe 'Create comment', type: :feature do
  let(:user) { User.create(name: 'Katja', email: 'katja@gmail.com', password: '123456') }

  scenario 'Create comment' do
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on 'Log in'
    fill_in 'post_content', with: 'This is a new post for testing.'
    click_on 'Save'
    fill_in 'comment_content', with: 'This is a new comment for testing.'
    click_on 'Comment'
    expect(page).to have_content('Katja: This is a new comment for testing.')
  end
end
