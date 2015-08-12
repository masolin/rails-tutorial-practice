require 'rails_helper'

RSpec.feature "Sessions", type: :feature do
  fixtures :users

  it 'cleans flash after existing login fail page' do
    visit '/login'
    fill_in 'Email', with: ' '
    fill_in 'Password', with: ' '
    click_button 'Log in'
    expect(page).to have_selector('div.alert-danger')
    visit root_path
    expect(page).not_to have_selector('div.alert-danger')
  end

  it 'renders correct user#show page after login' do
    user = users(:michael)
    visit '/login'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).not_to have_link('Log in', href: login_path)
    expect(page).to have_link('Log out', href: logout_path)
  end
end
