require 'rails_helper'

RSpec.feature "Users", type: :feature do
  it "signs me up with valid information" do
    visit '/users/new'
    expect do
      fill_in 'Name', with: 'Test User'
      fill_in 'Email', with: 'user@valid.com'
      fill_in 'Password', with: 'foobar'
      fill_in 'Password Confirmation', with: 'foobar'
      click_button 'Create My Account'
    end.to change(User, :count).by(1)
  end

  it "does not sign me up with invalid information" do
    visit '/users/new'
    expect do
      fill_in 'Name', with: ''
      fill_in 'Email', with: 'user@invalid.com'
      fill_in 'Password', with: 'foo'
      fill_in 'Password Confirmation', with: 'bar'
      click_button 'Create My Account'
    end.not_to change(User, :count)
  end
end
