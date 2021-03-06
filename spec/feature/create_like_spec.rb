require 'rails_helper'

RSpec.describe 'Give a like', type: :feature do
  let(:user) { User.create(name: 'Katja', email: 'katja@microverse.org', password: '123456789') }

  before(:example) do
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on 'Log in'
    fill_in 'post_content', with: 'This is a new post for testing.'
    click_on 'Save'
    click_on 'Like!'
  end

  scenario 'Give a like' do
    expect(page).to have_content('You liked a post.')
  end

  scenario 'Give a dislike' do
    click_on 'Dislike!'
    expect(page).to have_content('You disliked a post.')
  end
end
