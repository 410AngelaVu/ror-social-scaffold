require 'rails_helper'

RSpec.describe 'Create friendship', type: :feature do
  let(:user) { User.create(name: 'Katja', email: 'katja@microverse.org', password: '123456789') }
  let!(:seconduser) { User.create(name: 'Lava', email: 'lava@microverse.org', password: '123456789') }

  before(:example) do
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on 'Log in'
    click_on 'All users'
    click_on 'Add as friend'
  end

  scenario 'Send friend request' do
    expect(page).to have_content('Waiting friend confirmation from Lava')
  end

  scenario 'Accept friend request' do
    click_on 'Sign out'
    click_on 'Log in'
    fill_in 'user_email', with: seconduser.email
    fill_in 'user_password', with: seconduser.password
    click_on 'Log in'
    click_on 'All users'
    click_on 'Accept'
    expect(page).to have_content('You are already friends.')
  end
end
