require 'rails_helper'

RSpec.feature "Sessions", type: :feature do
  before :each do
    visit '/signup'
    fill_in 'Name', with: 'Michael Example'
    fill_in 'Email', with: 'michael@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Create My Account'
  end

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
    visit '/login'
    fill_in 'Email', with: 'michael@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).not_to have_link('Log in', href: login_path)
    expect(page).to have_link('Log out', href: logout_path)
  end
end
